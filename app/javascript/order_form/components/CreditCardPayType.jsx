import React from 'react'

class CreditCardPayType extends React.Component {
  render() {
    return (
      <div>
        <div className="field">
          <label htmlFor="order_credit_card_number">CC #</label>
          <input type="password"
                 name="order[credit_card_number]" 
                 id="order_credit_card_number"
                 className="form-control form-control-lg" />
        </div>
        <div className="field">
          <label htmlFor="order_expiration_date">Expiry</label>
          <input type="text"
                 name="order[expiration_date]" 
                 id="order_expiration_date"
                 size="9"
                 placeholder="e.g. 03/19"
                 className="form-control form-control-lg" />
        </div>
      </div>
    );
  }
}
export default CreditCardPayType
