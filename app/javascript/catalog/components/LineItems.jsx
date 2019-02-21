import React from 'react';
import LineItem from './LineItem';

export default class LineItems extends React.Component {
  handleRemoveFromCart = (id) => {
    this.props.handleRemoveFromCart(id); 
  };

 render = (id) => {
    var line_items = [];

    var self = this;
   	
 
    this.props.line_items.forEach(function(line_item) {
      line_items.push(<LineItem line_item={line_item}
                       handleRemoveFromCart={self.handleRemoveFromCart}
                       key={'line_item_' + line_item.id}/>);
      }
    );

    return(
      <table>
        <tbody>
          {line_items}
          <tr className="total_line">
                <td colSpan="2">Total:</td>
                <td className="total_cell">${this.props.total_price}</td>
          </tr>
        </tbody>
      </table>
    )
  }
}
