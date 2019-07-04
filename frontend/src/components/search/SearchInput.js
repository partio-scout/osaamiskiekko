import React, { useState } from 'react';
import styled from 'styled-components';
import { FormattedMessage, injectIntl } from 'react-intl';
import _ from 'lodash';
import {useGlobalStateContext} from '../../utils/GlobalStateContext';
import {getElementByXpath} from '../../utils/xpathLocator';

import { Dropdown } from 'semantic-ui-react';

const S = {};
S.SearchWrapper = styled.div`
label {
  color: ${props => props.theme.colors.textColor};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 20px;

  span {
    display: block;
    margin-bottom: 0.7em;
  }

  // Menu items
  .ui.dropdown .menu>.item {
    span {
      letter-spacing: normal;
    }
  }
  
  // Placeholder
  .default.text {
    font-style: italic;
  }

  // Normal text
  .text, .message {
    letter-spacing: normal;
  }
}

@media only screen and (max-width: 767px) {
  label {
    font-size: 14px;
    letter-spacing: 2px;
    line-height: 15px;  
  }
}

`;

export default injectIntl(function SearchInput(props) {
  const { labelKey, name, setSelection, options, value } = props;
  const [id] = useState(_.uniqueId());
  const globalState = useGlobalStateContext();

  const mobileAutoScroll = () => {
    var elmnt = document.getElementById("search-box");
    if (window.innerWidth <= 767) {
      elmnt.scrollIntoView();
    }
  };

  const dropdownOptions = (options) =>
    options.map((item) => {
      const value = (item.typed_id ? item.typed_id : item.id)
      const text = item[`name_${globalState.language}`];
      const description = item[`type_${globalState.language}`];

      return ({ key: value, value, text, description });
    });

  const handleChange = (value) => {
    setSelection(options.find(item => (item.typed_id ? item.typed_id : item.id) === value));
  }

  const alertText = getElementByXpath(`//*[@id="${id}"]//div[@class="text" and @role="alert"]`);
  if (alertText && !alertText.getAttribute('aria-atomic')) {
    console.log('alerts', alertText.getAttribute('aria-atomic'), alertText);
    alertText.setAttribute("aria-atomic", true);
  } else { console.log(`${id} not found`); }

  return (
    <S.SearchWrapper name={`${name}-component`}>
      {/* eslint-disable-next-line jsx-a11y/label-has-for */ }
      <label htmlFor={id}>
        <FormattedMessage id={labelKey} />
        {/* eslint-disable-next-line jsx-a11y/no-static-element-interactions */ }
        <div className="input-area" onFocus={(e) => mobileAutoScroll()}>
          <Dropdown
            id={id}
            icon='search'
            placeholder={props.intl.formatMessage({id: 'search.placeholder', defaultMessage: 'Search...'})}
            noResultsMessage={props.intl.formatMessage({id: 'search.noResults', defaultMessage: 'Search...'})}
            fluid
            search
            selection
            value={value && (value.typed_id ? value.typed_id : value.id)}
            onChange={(e, {value}) => handleChange(value)}
            options={options && dropdownOptions(options)}
          />
        </div>
      </label>
    </S.SearchWrapper>
  )
});
