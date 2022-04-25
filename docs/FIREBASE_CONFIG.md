## Firebase Environment Setup

In order to run the app locally all developers must do some initial setup once for firebase.

Developers would not have access to the production firebase environment. Instead, they would have to rely on their own firebase setups.

### Directory Setup 
- Create a folder called **environments** inside of your root folder. ```[PROJECT]/environments```
- By default, this folder is added to gitignore, and it should remain that way.
- Now make subfolders for the environments you want to create. For example if you wanted to create a dev and a staging environment then we would have two subfolders. ```[PROJECT]/environments/dev``` and ```[PROJECT]/environments/staging```
- These subfolders should have the ***google-services.json*** and the ***GoogleService-Info.plist*** that you want to use.

### Run script 
The script right now lives in a separate package called ***env_generator*** inside our project. I propose we make this into a separate pub package later on.

- cd into ```packages/env_generator/lib```
- On your terminal run ```dart env_generator.dart```
- The script would now create ```.env.*``` files inside your environments directory
- A placeholder empty .env file would also be created in project root. This is needed to declare it as an asset in pubspec for production build

All the generated files are added inside of gitignore by default. 

### How it works? 
The environment generator simply extracts the useful information we would require to initialize ***Firebase Options*** and add them inside of env files to be consumed by the **dotenv** package.

The initializeFirebase helper method then initializes Firebase with the provided environment. 

```dart 
await initializeFirebase(env: FirebaseEnv.dev);
```

***NOTE:*** While the script is agnostic to your folder structure name, we would have to follow a convention for resident. As to initialize inside of our app we would be relying on predefined enums which would try to lookup filenames to load config easily 


### Data Script [INCOMPLETE]
Backend team to update this section with instructions for data populations to our own firebase environments.