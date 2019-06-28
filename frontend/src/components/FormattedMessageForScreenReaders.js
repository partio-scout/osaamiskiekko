import React from 'react';
import { FormattedMessage } from 'react-intl';
import styled from 'styled-components';

const S = {};
S.FormattedMessageForScreenReaders = styled.div`
position: absolute;
left: -9999px;
`;

const FormattedMessageForScreenReaders = (props) => {
  return (
    <S.FormattedMessageForScreenReaders className='screenreader-only'>
      <FormattedMessage id={props.id} values = {props} />
    </S.FormattedMessageForScreenReaders>
  );
}

export default FormattedMessageForScreenReaders;