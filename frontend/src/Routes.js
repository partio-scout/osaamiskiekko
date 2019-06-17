import React from 'react';
import { Switch, Route } from 'react-router-dom'
import Credit from './views/Credit';
import MarkdownPage from './views/MarkdownPage';
import Home from './views/Home';
import CurveTest from './views/CurveTest';
import GlobalStyle from './styles/GlobalStyles';
import Footer from './components/Footer';

const Main = () => {
  return (
    <>
      <GlobalStyle />
        <Switch>
          <Route exact path='/' component={Home} />
          <Route exact path='/ahot/:id' component={Credit} />
          <Route exact path='/curvetest' component={CurveTest} />
          <Route exact path='/:pageName' component={MarkdownPage} />
          <Route component={MarkdownPage} />
        </Switch>
        <Footer />
    </>
  );
}

export default Main;
