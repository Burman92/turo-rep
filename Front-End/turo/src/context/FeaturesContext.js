import  {useState, useEffect, createContext} from 'react';

export const FeaturesContext = createContext();

export function FeaturesProvider({children}){

  const [featuresInfo, setFeaturesInfo] = useState(['null']);

  useEffect(() => {
    fetch(`https://turo-backend-db.herokuapp.com/car/1/features`)
     .then((response) => {
        return response.json()
    })
    .then((actualData) => setFeaturesInfo(actualData));
  }, []);

  return (
    <FeaturesContext.Provider value = {{featuresInfo}}>
        {children}
    </FeaturesContext.Provider>
  );
}    
 