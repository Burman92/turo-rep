import React from 'react';
import logo from './favicon.ico';

function Header() {
  return (
    <header className="header">
      <div className="header__logo">
        <img src={logo} alt="Turo Logo" style={{width: '100px'}} />
      </div>
      <nav className="header__nav">
      </nav>
      <div className="header__search">
        <input type="text" placeholder="City, airport, address or house" />
      </div>
    </header>
  );
}

export default Header;