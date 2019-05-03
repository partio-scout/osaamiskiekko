import React, { Component } from 'react'
import { Menu } from 'semantic-ui-react'
import styled from 'styled-components';

const MenuLink = styled(Menu.Item)`
  &&& {
    color: #4736FF;
  }
`

export default class NavLinks extends Component {
  state = { activeItem: 'home' }

  handleItemClick = (e, { name }) => this.setState({ activeItem: name })

  render() {
    const { activeItem } = this.state

    return (
      <Menu secondary stackable>
        <MenuLink name='Osaamiskiekko' active={activeItem === 'Osaamiskiekko'} onClick={this.handleItemClick} />
        <MenuLink
          name='Tietoa'
          active={activeItem === 'Tietoa'}
          onClick={this.handleItemClick}
        />
        <MenuLink
          name='Ota yhteyttä'
          active={activeItem === 'Ota yhteyttä'}
          onClick={this.handleItemClick}
        />
      </Menu>
    )
  }
}