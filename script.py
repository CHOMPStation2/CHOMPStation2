import os

def read_and_modify_files_in_directory(directory_path):
    try:
        print(f"Scanning directory: {directory_path}")
        file_count = 0
        for root, dirs, files in os.walk(directory_path):
            level = root.replace(directory_path, '').count(os.sep)
            indent = ' ' * 4 * level

            print(f"{indent}Entering directory: {root}")
            for file in files:
                if file.endswith(".dm"):
                    file_count += 1
                    file_path = os.path.join(root, file)
                    print(f"{indent}    Found .dm file: {file_path}")
                    modify_dm_file(file_path, indent)
                elif file.endswith(".dmm"):
                    file_count += 1
                    file_path = os.path.join(root, file)
                    print(f"{indent}    Found .dmm file: {file_path}")
                    modify_dmm_file(file_path, indent)

        if file_count == 0:
            print(f"No .dm or .dmm files found in directory: {directory_path}")
        else:
            print(f"Total files modified: {file_count}")
    except Exception as e:
        print(f"An error occurred while reading files: {e}")

def modify_dm_file(file_path, indent):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            contents = file.read()

        # Perform flexible replacements (catch "var/obj/item/weapon" and others)
        modified_contents = contents.replace("obj/item/weapon", "obj/item")
        modified_contents = modified_contents.replace("obj/item/device", "obj/item")

        # Check if any changes were made
        if contents != modified_contents:
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(modified_contents)
            print(f"{indent}    File modified successfully: {file_path}")
        else:
            print(f"{indent}    No changes made to: {file_path}")

    except FileNotFoundError:
        print(f"{indent}    Error: The file {file_path} was not found.")
    except Exception as e:
        print(f"{indent}    An error occurred while modifying {file_path}: {e}")

def modify_dmm_file(file_path, indent):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            contents = file.read()

        # Perform flexible replacements (catch "var/obj/item/weapon" and others)
        modified_contents = contents.replace("obj/item/weapon", "obj/item")
        modified_contents = modified_contents.replace("obj/item/device", "obj/item")

        # Check if any changes were made
        if contents != modified_contents:
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(modified_contents)
            print(f"{indent}    .dmm file modified successfully: {file_path}")
        else:
            print(f"{indent}    No changes made to .dmm file: {file_path}")

    except FileNotFoundError:
        print(f"{indent}    Error: The .dmm file {file_path} was not found.")
    except Exception as e:
        print(f"{indent}    An error occurred while modifying .dmm file {file_path}: {e}")

# Get the directory where the script is located
directory_path = os.path.dirname(os.path.abspath(__file__))
print(f"Script directory: {directory_path}")

# Start the process
read_and_modify_files_in_directory(directory_path)

# Prevent the script from closing immediately
input("\nProcess completed. Press Enter to close the script...")
