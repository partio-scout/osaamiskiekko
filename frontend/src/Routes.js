import React from 'react';
import { Switch } from 'react-router-dom'
import { LiveRoute } from 'react-aria-live-route'
import { injectIntl } from 'react-intl';
import Credit from './views/Credit';
import MarkdownPage from './views/MarkdownPage';
import Home from './views/Home';
import CurveTest from './views/CurveTest';
import GlobalStyle from './styles/GlobalStyles';
import Footer from './components/Footer';

const Main = (props) => {
  return (
    <>
      <GlobalStyle />
        <div id='router-content-area'>
          <Switch>
            <LiveRoute exact path='/' component={Home} 
              liveMessage={props.intl.formatMessage({id: 'navigation.message.home'})}
              aria-live="assertive" />
            <LiveRoute exact 
              path='/ahot/:id' component={Credit} 
              liveMessage={props.intl.formatMessage({id: 'navigation.message.credit'})}
              aria-live="assertive" />
            <LiveRoute exact path='/curvetest' component={CurveTest}
              liveMessage={props.intl.formatMessage({id: 'navigation.message.test'})}
              aria-live="assertive" />
            <LiveRoute exact path='/tietoa' 
              render={(props) => <MarkdownPage {...props} pageName='tietoa' />} 
              liveMessage={props.intl.formatMessage({id: 'navigation.message.information'})}
              aria-live="assertive" />
            <LiveRoute exact path='/otayhteytta' 
              render={(props) => <MarkdownPage {...props} pageName='otayhteytta' />} 
              liveMessage={props.intl.formatMessage({id: 'navigation.message.contact'})}
              aria-live="assertive" />
            <LiveRoute component={MarkdownPage} 
              liveMessage={props.intl.formatMessage({id: 'navigation.message.error'})}
              aria-live="assertive"  /> { /* If no page, show error (with MarkdownPage) */ }
          </Switch>
        </div>
        <Footer />
    </>
  );
}

export default injectIntl(Main);
