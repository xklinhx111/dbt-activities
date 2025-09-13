# dbt Activities

1. Create a new Google Project named `dbt-tutorial`.

2. Create a service account for dbt with the appropriate permissions.

   <details>
     <summary>Solution</summary>

   You should give the following roles to the service account:

    - BigQuery Data Editor
    - BigQuery User

   </details>

3. Initialize a new dbt project called `dbt_tutorial` and configure your profile to connect to your data warehouse.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt init
   ```

   </details>

4. Open your dbt project folder as a workspace in VS Code.

5. Check that your connection is working.

   <details>
     <summary>Solution</summary>

   ```bash
   cd dbt_tutorial
   dbt debug
   ```

   </details>

6. Create a commit with an appropriate message.

   <details>
     <summary>Solution</summary>

   ```bash
   git add .
   git commit -m "Initialize dbt project"
   ```

   </details>

7. Push your dbt project to your GitHub repository.

   <details>
     <summary>Solution</summary>

   ```bash
   git remote add origin <YOUR_REPO_URL>
   git push -u origin main
   ```

   </details>

8. Build the example dbt models in your data warehouse.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt run
   ```

   </details>

9. Delete the example models in the `models/` folder.

10. Download all CSV files from [datasets/](datasets/), then load them into a dataset named `raw` on BigQuery. Table names should match the CSV file names.

11. Create a new branch named `add-dbt-sources` and switch to it.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout -b add-dbt-sources
    ```

    </details>

12. In a `models/sources.yml` file, declare dbt sources for the tables you just loaded. Suppose all your data comes from an e-commerce application called *Jaffle Shop*. Give them appropriate source and table names.

13. Commit and push your branch to GitHub.

    <details>
      <summary>Solution</summary>

    ```bash
    git add models/sources.yml
    git commit -m "Add dbt sources for raw tables"
    git push -u origin add-dbt-sources
    ```

    </details>

14. Delete the Google Project.

15. Delete the GitHub repository.

16. Delete your local dbt project folder.

    <details>
      <summary>Solution</summary>

    ```bash
    rm -rf <PATH_TO_YOUR_DBT_PROJECT>
    ```

    </details>
