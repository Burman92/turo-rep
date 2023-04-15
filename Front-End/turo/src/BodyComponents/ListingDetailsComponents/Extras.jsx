import React, {useContext} from 'react';
import './Extras.css'

import { ExtrasContext } from '../../context/ExtrasContext';


export default function Extras() {

    const context = useContext(ExtrasContext);
    const extrasDetails = context.extrasInfo;
    console.log(extrasDetails);

  return (
    <div>
      <h2 className='listingDetailsHeader'> Extras </h2>
      <div className='ExtrasDisclaimerContainer'>
        <span className='ExtrasDisclaimer'> Add optional Extras to your trip at checkout. </span>
        <img className='extrasQuestionMark' src="https://cdn-icons-png.flaticon.com/512/0/827.png"></img>
      </div>  
      {extrasDetails.map((extra) => {
        return(
            <div className='extraContainer'>
                <span className='extraTitle'> {extra.extra_name} </span>
                <span className='extraDescription'> {extra.extra_description} </span>
                <div classNam='extraCostAvailable'>
                    <span className='extraCost'> ${extra.extra_cost}/trip </span>
                    <span className={extra.extra_number_available > 0 ? 'extraNumberAvailable' : 'displayOff'}>{extra.extra_number_available} available </span>
                </div>
            </div>
        )})       
      }        
    </div>
  )
}
