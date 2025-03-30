use itertools::iproduct;
use maze_generator::ellers_algorithm::EllersGenerator;
use maze_generator::prelude::{Direction, Generator};
use meowtonin::{ByondResult, ByondValue, FromByond, ToByond};
use pathfinding::undirected::prim::prim;

pub type Vector = (usize, usize);

pub fn dist(a: usize, b: usize) -> isize {
    b as isize - a as isize
}

pub fn dist_vec(a: &Vector, b: &Vector) -> f64 {
    let dx = dist(a.0, b.0) as f64;
    let dy = dist(a.1, b.1) as f64;
    (dx * dx + dy * dy).sqrt()
}

#[derive(Clone)]
pub struct Room {
    pub center: Vector,
    pub size: Vector
}

impl FromByond for Room {
    fn from_byond(value: &ByondValue) -> ByondResult<Self> {
        let list: Vec<Vector> = value.to()?;
        Ok(Self {
            center: list[0],
            size: list[1]
        })
    }
}

/// Generates a maze
#[byond_fn]
pub fn generate_maze(
    limit_x: ByondValue,
    limit_y: ByondValue,
) -> ByondResult<ByondValue> {
    let limit_x: usize = limit_x.to()?;
    let limit_y: usize = limit_y.to()?;
    let mut output = vec![true; limit_x * limit_y];
    // Half it, since the maze generator walls are 0 tiles large.
    let maze = EllersGenerator::new(None).generate(limit_x as i32 / 2, limit_y as i32 / 2)
        .unwrap();
    for (y, x) in iproduct!(0..limit_x / 2 - 1, 0..limit_y / 2 - 1) {
        let field = maze.get_field(&(x as i32, y as i32).into()).unwrap();
        let mut update = |mx, my| output[(x as i32*2+1+mx) as usize * limit_x + (y as i32*2+1+my) as usize] = false;
        update(0, 0);

        // Passages are 2-way, so we only check south/west
        if y > 0 && !field.has_passage(&Direction::South) {
            update(0, -1);
        }
        if x > 0 && !field.has_passage(&Direction::West) {
            update(-1, 0);
        }
        if y < limit_y && !field.has_passage(&Direction::North) {
            update(0, 1);
        }
        if x < limit_x && !field.has_passage(&Direction::East) {
            update(1, 0);
        }
    }
    output.to_byond()
}

/// Generates pathways between rooms.
#[byond_fn]
pub fn generate_pathways(
    limit_x: ByondValue,
    limit_y: ByondValue,
    rooms: ByondValue,
) -> ByondResult<ByondValue> {
    let limit_x: usize = limit_x.to()?;
    let limit_y: usize = limit_y.to()?;
    let rooms: Vec<Room> = rooms.to()?;

    // Construct a MST using prim's for the big paths
    let edges = iproduct!(0..rooms.len(), 0..rooms.len());
    let graph = edges.map(|(u, v)| (u, v, dist_vec(&rooms[u].center, &rooms[v].center) as u64))
        .collect::<Vec<_>>();
    let mst = prim(graph.as_slice()).into_iter().map(|(u, v, _)| (get_connection(&rooms[*u], &rooms[*v]), get_connection(&rooms[*v], &rooms[*u])));

    // Now make a graph that we can put the paths on.
    let mut grid = vec![false; limit_x * limit_y];

    // Put those nodes from the graph onto the grid
    for (start, end) in mst {
        let mut fill = |range, fixed| for i in range {
            grid[i * fixed] = true
        };
        if dist(start.0, end.0) > dist(start.1, end.1) {
            // X distance is longer than Y, so the path goes half across the x, across the y, then half across the x
            let half = (start.0 + end.0) / 2;
            fill(start.0..start.0 + half, start.1);
            fill(start.0..start.0 + half, half);
            fill(start.0 + half..end.0, end.1);
        } else {
            // Y is longer than the x, so it's flipped
            let half = (start.1 + end.1) / 2;
            fill(start.1..start.1 + half, start.0);
            fill(start.0..end.0, half);
            fill(start.1 + half..end.1, end.0);
        }
    }

    grid.to_byond()
}

fn get_connection(first: &Room, second: &Room) -> Vector {
    let diff = (dist(second.center.0, first.center.0),
                dist(second.center.0, first.center.0));
    if diff.0 > diff.1 {
        ((first.center.0 as isize + diff.0.signum() * first.size.0 as isize) as usize, first.center.1)
    } else {
        (first.center.1, (first.center.1 as isize + diff.1.signum() * first.size.1 as isize) as usize)
    }
}

#[cfg(test)]
mod test {
    use meowtonin::ToByond;
    use crate::pathways::generate_maze;

    #[test]
    fn test_generate_maze() {
        let _ = generate_maze(400.to_byond().unwrap(), 400.to_byond().unwrap()).unwrap();
    }
}