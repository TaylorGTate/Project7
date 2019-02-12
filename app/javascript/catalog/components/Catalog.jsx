import React from 'react';
import axios from 'axios';
import BookList from './BookList';

export default class Catalog extends React.Component {

    state = { books: [] };

    componentDidMount = () => {
        var self = this;

        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/')
            .then(function (response) {
                console.log(response.data);
                self.setState({ books: response.data })
            })
            .catch(function (error) {
                console.log(error);
            });
    };  

    render = () => {
        return(
      		 <div className="container">
        			<div className="row">
              				<BookList books={this.state.books}/>
          			</div>
      			</div>  
        	);
    };
}   
