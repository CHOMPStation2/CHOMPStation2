import { resolveAsset } from 'tgui/assets';
import { useBackend } from 'tgui/backend';
import { NtosWindow } from 'tgui/layouts';
import {
  Button,
  Image,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

type Data = {
  message: string;
  showing_archived: BooleanLike;
  download: {
    download_progress: number;
    download_maxprogress: number;
    download_rate: number;
  } | null;
  article: { title: string; cover: string; content: string } | null;
  all_articles: {
    name: string;
    size: number;
    uid: number;
    archived: BooleanLike;
  }[];
};

export const NtosNewsBrowser = (props) => {
  const { act, data } = useBackend<Data>();

  const { article, download, message } = data;

  let body = <ViewArticles />;

  if (article) {
    body = <SelectedArticle />;
  } else if (download) {
    body = <ArticleDownloading />;
  }

  return (
    <NtosWindow width={575} height={750}>
      <NtosWindow.Content scrollable>
        {!!message && (
          <NoticeBox>
            {message}{' '}
            <Button icon="times" onClick={() => act('PRG_clearmessage')} />
          </NoticeBox>
        )}
        {body}
      </NtosWindow.Content>
    </NtosWindow>
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
      title={`Viewing: ${title}`}
      buttons={
        <Stack>
          <Stack.Item>
            <Button icon="save" onClick={() => act('PRG_savearticle')}>
              Save
            </Button>
          </Stack.Item>
          <Stack.Item>
            <Button icon="times" onClick={() => act('PRG_reset')}>
              Close
            </Button>
          </Stack.Item>
        </Stack>
      }
    >
      {!!cover && <Image src={resolveAsset(cover)} />}
      {/** biome-ignore lint/security/noDangerouslySetInnerHtml: News articles are written in premade .html files and cannot be edited by players, so it should be
       * safe enough to use dangerouslySetInnerHTML here. */}
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
            >
              {article.size} GQ
            </LabeledList.Item>
          ))) || (
          <LabeledList.Item label="Error">
            There appear to be no outstanding news articles on NTNet today.
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

const ArticleDownloading = (props) => {
  const { act, data } = useBackend<Data>();

  const { download_progress, download_maxprogress, download_rate } =
    data.download!;

  return (
    <Section title="Downloading...">
      <LabeledList>
        <LabeledList.Item label="Progress">
          <ProgressBar
            color="good"
            minValue={0}
            value={download_progress}
            maxValue={download_maxprogress}
          >
            {download_progress} / {download_maxprogress} GQ
          </ProgressBar>
        </LabeledList.Item>
        <LabeledList.Item label="Download Speed">
          {download_rate} GQ/s
        </LabeledList.Item>
        <LabeledList.Item label="Controls">
          <Button icon="ban" fluid onClick={() => act('PRG_reset')}>
            Abort Download
          </Button>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
