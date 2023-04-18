import React, { useContext, useState, useEffect } from 'react'
import {ReactComponent as Star} from './asset 60.svg'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import { ReviewContext } from '../../context/ReviewsContext'
import './UserReviews.css';

export default function UserReview({review, rating}) {
    const [userRating, setRating] = useState(rating)
    const [ratingArray, setRatingArray]= useState(Array.from({length: rating}, (v, i) => i))
    const [formattedDate, setFormattedDate] = useState('');


    // creates an array of numbers with length of rating. 
    useEffect(()=>{
        if(review){
        const reviewDate = new Date(review.review_date);
        const options = { year: 'numeric', month: 'long', day: 'numeric'};
        const newDate = reviewDate.toLocaleDateString('en-US', options);
        setFormattedDate(newDate)
        }
        console.log(ratingArray)
        setRatingArray(Array.from({length: userRating}, (v, i) => i));

    }, [userRating])

    
    return (
        review ? (
        <div className='d-flex align-content-center' style={{width: '100%', border: "1px solid black", borderBottom: '1px solid  #E7E7E8'}}>
            <div style={{borderRadius: '15984px', border: "1px solid black", height: '48px', width: '48px'}}></div>
            {/*renders star components based on the length of ratingArray*/} 
 
             <div style={{marginLeft: '10px'}}> 
            {ratingArray.map((item, index) => (
                <div className='row' key = {index}>
                    {/* <Star className="star" /> */}
                </div>
                ))}  
            </div>
            <div className='reviewContent'>
                <p>{review.user_name} <span className='review-date'>{formattedDate}</span></p>  
                <p>{review.review_message}</p>
            </div>   
             

            
        </div>
        ) : (<></>)
    )
}