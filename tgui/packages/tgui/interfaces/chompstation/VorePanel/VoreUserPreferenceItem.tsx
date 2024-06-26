import { BooleanLike } from 'common/react';

import { useBackend } from '../../../backend';
import { Button } from '../../../components';

export const VoreUserPreferenceItem = (props: {
  spec: {
    action: string;
    test: BooleanLike;
    tooltip: { main: string; enable: string; disable: string };
    content: { enabled: string; disabled: string };
    fluid?: boolean;
    back_color?: { enabled: string; disabled: string };
  };
  [rest: string]: any;
}) => {
  const { act } = useBackend();

  const { spec, ...rest } = props;
  const { action, test, tooltip, content, fluid = true, back_color } = spec;

  return (
    <Button
      onClick={() => act(action)}
      icon={test ? 'toggle-on' : 'toggle-off'}
      selected={test}
      fluid={fluid}
      backgroundColor={
        back_color ? (test ? back_color.enabled : back_color.disabled) : ''
      }
      tooltip={tooltip.main + ' ' + (test ? tooltip.disable : tooltip.enable)}
      {...rest}
    >
      {test ? content.enabled : content.disabled}
    </Button>
  );
};
