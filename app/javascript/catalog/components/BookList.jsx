import React from 'react';
import Book from './Book';

export default class BookList extends React.Component {
  render = () => {
    var books = [];

    this.props.books.forEach(function(book) {
      books.push(<Book book={book}
                         key={'book' + book.id}/>);
      }
    );

    return(
      <table className="table table-striped" width="auto">
        <thead>
          <tr>
            <th scope="col">Image url</th>          
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Popularity</th>            
          </tr>
        </thead>
        <tbody>
          {books}
        </tbody>
      </table>
    )
  }
}
