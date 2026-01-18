import type { ReactNode } from 'react';
import { Section } from 'tgui-core/components';

export const Header = (props: { dateDropdown: ReactNode | null }) => {
  const { dateDropdown } = props;

  return (
    <Section>
      <h1>VOREStation Changelist</h1>
      <p>
        {'The GitHub repository can be found '}
        <a href="https://github.com/CHOMPStation2/CHOMPStation2">here</a>
        {', recent GitHub contributors can be found '}
        <a href="https://github.com/CHOMPStation2/CHOMPStation2/pulse/monthly">
          here
        </a>
        .
      </p>
      <p>
        {'Visit our wiki '}
        <a href="https://wiki.chompstation13.net/index.php/Chomp_Station_Wiki">
          here
        </a>
        {', check out our discord server '}
        <a href="https://discord.com/invite/chompers">here</a>.
      </p>
      {dateDropdown}
    </Section>
  );
};
