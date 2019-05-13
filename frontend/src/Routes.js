import React from 'react';
import { Switch, Route } from 'react-router-dom'
import Home from './views/Home';
import Information from './views/Information';
import Contact from './views/Contact';

const Main = () => {
  return (
    <main>
      <Switch>
        <Route exact path='/' component={Home} />
        <Route exact path='/tietoa' component={Information} />
        <Route exact path='/otayhteytta' component={Contact} />
      </Switch>
    </main>
  );
}

export default Main;