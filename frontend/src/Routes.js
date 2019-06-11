import React from 'react';
import { Switch, Route } from 'react-router-dom'
import Credit from './views/Credit';
import MarkdownPage from './views/MarkdownPage';
import Home from './views/Home';
import CurveTest from './views/CurveTest';
import GlobalStyle from './styles/GlobalStyles';

const Main = () => {
  return (
    <>
      <GlobalStyle />
        <Switch>
          <Route exact path='/' component={Home} />
          <Route exact path='/ahot/:id' component={Credit} />
          <Route exact path='/curvetest' component={CurveTest} />
          <Route exact path='/:pageName' component={MarkdownPage} />
        </Switch>
    </>
  );
}

export default Main;
