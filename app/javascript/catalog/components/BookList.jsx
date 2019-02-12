import React from 'react';
import Book from './Book';
import SortColumn from './SortColumn';

export default class BookList extends React.Component {
  handleSortColumn = (name, order) => {
        this.props.handleSortColumn(name, order);
  };
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
           <th scope="col" className="sortable">
  						<SortColumn
    						name="title"
    						text="Title"
    						sort={this.props.sort}
    						order={this.props.order}
    						handleSortColumn={this.handleSortColumn}
  						/>
					</th> 
            <th scope="col">Description</th>
            <th scope="col" className="sortable">
  						<SortColumn
    						name="price"
    						text="Price"
    						sort={this.props.sort}
    						order={this.props.order}
    						handleSortColumn={this.handleSortColumn}
  						/>
					</th>
            <th scope="col" className="sortable">
  						<SortColumn
    						name="popularity"
    						text="Popularity"
    						sort={this.props.sort}
    						order={this.props.order}
    						handleSortColumn={this.handleSortColumn}
  						/>
					</th>            
          </tr>
        </thead>
        <tbody>
          {books}
        </tbody>
      </table>
    )
  }
}
