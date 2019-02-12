import React from 'react';
import PropTypes from 'prop-types';

export default class Book extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string,
    image_url: PropTypes.string,
    price: PropTypes.number,
    popularity: PropTypes.number
  };

  render = () => {
    return(
      <tr className="spa_entry">
        <td>
          <img src={this.props.book.image_url.url} />
        </td>      
        <td>{this.props.book.title}</td>
        <td dangerouslySetInnerHTML={{__html: this.props.book.description}}></td>
        <td>{this.props.book.price}</td>
        <td>{Number(this.props.book.popularity)}</td>        
      </tr>
    )
  };
}
