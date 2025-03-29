/* eslint react/no-danger: "off" */
import { resolveAsset } from 'tgui/assets';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Button, Image, LabeledList, Section } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

type Data = {
  showing_archived: BooleanLike;
  article: { title: String; cover: string; content: string } | null;
  all_articles: { name: string; uid: number; archived: BooleanLike }[];
};

export const StarcasterCh = (props) => {
  const { data } = useBackend<Data>();

  const { article } = data;

  let body = <ViewArticles />;

  if (article) {
    body = <SelectedArticle />;
  }

  return (
    <Window width={575} height={750}>
      <Window.Content scrollable>{body}</Window.Content>
    </Window>
  );
};

const SelectedArticle = (props) => {
  const { act, data } = useBackend<Data>();

  const { article } = data;

  if (!article) {
    return <Section>Error: Article not found.</Section>;
  }

  const { title, cover, content } = article;

  return (
    <Section
      title={'Viewing: ' + title}
      buttons={
        <Button icon="times" onClick={() => act('PRG_reset')}>
          Close
        </Button>
      }
    >
      {!!cover && <Image src={resolveAsset(cover)} />}
      {/* News articles are written in premade .html files and cannot be edited by players, so it should be
       * safe enough to use dangerouslySetInnerHTML here.
       */}
      <div dangerouslySetInnerHTML={{ __html: content }} />
    </Section>
  );
};

const ViewArticles = (props) => {
  const { act, data } = useBackend<Data>();

  const { showing_archived, all_articles } = data;

  return (
    <Section
      title="Articles List"
      buttons={
        <Button.Checkbox
          onClick={() => act('PRG_toggle_archived')}
          checked={showing_archived}
        >
          Show Archived
        </Button.Checkbox>
      }
    >
      <LabeledList>
        {(all_articles.length &&
          all_articles.map((article) => (
            <LabeledList.Item
              label={article.name}
              key={article.uid}
              buttons={
                <Button
                  icon="download"
                  onClick={() => act('PRG_openarticle', { uid: article.uid })}
                />
              }
            />
          ))) || (
          <LabeledList.Item label="Error">
            Unable to connect to Starfire database.
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};
