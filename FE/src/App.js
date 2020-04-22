import React from 'react';
import './reset.css'
import LocalNavigation from './LocalNavigation/LocalNavigation';
import Header from './Header/Header'
import Navigation from './Navigation/Navigation'

const App = () => {
  return (
    <>
    <LocalNavigation />
    <Header />
    <Navigation />
    </>
  );
}

export default App;
