import React, { useState } from 'react';
import styled from 'styled-components';
import { FormattedMessage, injectIntl } from 'react-intl';
import _ from 'lodash';
import {useGlobalStateContext} from '../../utils/GlobalStateContext';

import { Dropdown } from 'semantic-ui-react';

const S = {};
S.SearchWrapper = styled.div`
// margin: auto;
// position: relative;
// display: flex;
// flex-direction: column;

label {
  color: ${props => props.theme.colors.textColor};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 20px;

  span {
    display: block;
    margin-bottom: 0.7em;
  }

  // .input-area {
  //   position:relative;
  // }
  
  // Input field
  .ui.search.selection.dropdown>input.search {
    // font-size: 20px;
    // line-height: 30px;
    // padding: inherit;
  }

  // Menu items
  .ui.dropdown .menu>.item {
    // padding: 20px 10px 20px 10px;
    // border-bottom: solid 1px #202020;
    span {
      // color: ${props => props.theme.colors.textColor};
      // margin: 0px;
      letter-spacing: normal;
      // font-size: 18;
    }
  }
  
  // Placeholder
  .default.text {
    // color: ${props => props.theme.colors.textColor};
    // opacity: 1;
    // font-size: 20px;
    // line-height: 30px;
    font-style: italic;
  }

  // Normal text
  .text, .message {
    // color: ${props => props.theme.colors.textColor};
    // opacity: 1;
    // font-size: 20px;
    // line-height: 30px;
    letter-spacing: normal;
  }
}

@media only screen and (max-width: 767px) {
  label {
    font-size: 14px;
    letter-spacing: 2px;
    line-height: 15px;  

    // input, input::placeholder {
    //   font-size: 16px;
    //   line-height: 24px
    // }
  
    // fa-search: {
    //   font-size: 20px;
    // }
  }
}

// .item {
//   display: flex !important;
//   flex-direction: column-reverse;
// }

// .text {
//   color: ${props => props.theme.colors.textColor};
//   margin: 0px;
// }

// .description {
//   font-size: 12px;	
//   letter-spacing: 2px;
//   line-height: 15px;
// }
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

  return (
    <S.SearchWrapper name={`${name}-component`}>
      { /* eslint-disable jsx-a11y/label-has-for */}
      <label htmlFor={id}>
        { /* eslint-enable jsx-a11y/label-has-for */}
        <FormattedMessage id={labelKey} />
        <div className="input-area" onFocus={(e) => mobileAutoScroll()} role='button'> 
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
