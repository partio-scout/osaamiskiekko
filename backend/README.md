# Backend

To update the database, update the JSON files in the `data` folder and then run `node makeDatabase.js`.

`makeDatabase.js` will generate JSON files based on these data files and store them in `/frontend/public/data`.

Note that the generated files in `/frontend/public/data` should be included in the git repository,
as `makeDatabase.js` is not run when deploying the software.
