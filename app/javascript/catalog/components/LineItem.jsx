import React from 'react';
import PropTypes from 'prop-types';

export default class LineItem extends React.Component {
  static propTypes = {
    quantity: PropTypes.number,
    title: PropTypes.string,
    total_price: PropTypes.number,
  };

 handleRemoveFromCart = (e) => {
    this.props.handleRemoveFromCart(this.props.line_item.id); 
  };

  render = () => {
    return(
      <tr className="entry">
        <td>{this.props.line_item.quantity}&times;</td>
        <td>{this.props.line_item.title}</td>
        <td className="item_price">${this.props.line_item.total_price}</td>
        <td>
          <a className="btn btn-success"
             onClick={this.handleRemoveFromCart} >
            -
          </a>
        </td> 
      </tr>
    )
  };
}
