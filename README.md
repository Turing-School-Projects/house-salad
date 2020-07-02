# House Salad API Consumption Refactor

The purpose of the House Salad API Consumption Refactor exercise is to refactor the House Salad app with a particular focus on abstraction and encapsulation. This workshop was very helpful with solidifying the concepts of abstraction and encapsulation, and how they can be implemented during refactoring using declarative programming and the Red, Green, Refactor technique.

### Refactored Items
I refactored out the calls to the API from the SearchController into a PropublicaService class, whose sole responsibility is calling out to the API and obtaining information. This code was then further refactored to split the connection to the API from the specific GET request. This was done so that the PropublicaService can be used to request other information from the Propublica API, without having to duplicate the code for the connection. This is a huge benefit for the adaptability of the app. This change also makes the overall app more flexible because it allows for the app to easily change the API without having to update a bunch of methods throughout the app. The only changes that would be required would be a new service with a new API URI, and perhaps updating the key names in the Member object instantiation to match the key names from the new API.

The logic of converting the results from the API into Member objects was also refactored out of the SearchController and into a new SearchResults poro. This new SearchResults poro follows encapsulation and abstraction because it encapsulates the creation of the Member objects into a single-responsibility class. It also follows abstraction because the actual call for information is abstracted out into the PropublicaService because the creation of Member objects does not need to know how the information needed to create those objects is obtained, it just needs the information.  

Finally, a new Member class was created to instantiate Member objects with specific attributes that can be called in the view, instead of sifting through the hash in the view. There are many benefits of instantiating Member objects instead of searching through the Hash for the desired information. By instantiating objects, the code is much more versatile and can be easily updated to accommodate changes to the API. For example, if the key names change in the API, you only need to update the initialization method in the Member object, instead of having to change the key name in every view that displays that information. Similarly, instantiating a Member object gives the developer more control over the names of attributes and what information is available for use. Perhaps the developer wants to name the `party` attribute `political_party` instead, for more clarity. That change would not be possible without instantiating an object because the developer would be dependent on the keys provided via the API.
