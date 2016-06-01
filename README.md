# SBA Snippets

### https://sba-snippets.herokuapp.com/

rails new sba_snippets -d mysql

*init*

rake db:create

*mysql*

- rails g devise:install
- rails g devise User
- rails g devise:views
- rake db:migrate
-rake db:seed

*devise User*

- rails g scaffold Snippet title code:text user:references
- rake db:migrate

*scaffolded Snippet*

- rails g scaffold Comment user:references snippet:references text:text
- rake db:migrate

*scaffolded Comment*

*removed scaffold.scss and rename application.css to application.scss*

- bundle

*bootstrap & font-awesome*

*recommended nesting technique and has many association*

*user reference logic and authentication*

*secure snippet & comment destroy*

- rails g model Language
- rake db:migrate
- rake db:seed
- rails g migration AddLanguageToSnippets
- rake db:migrate

*generated Languages, seeded and snippet association*

- bundle

*ms-dropdown setup and more seed logic*

- bundle

*adds styles, layout, partials and final touches*

- heroku create
- bundle --without production
- git push heroku master
- heroku run rake db:migrate
- heroku run rake db:seed

*heroku ready*

- bundle

*resque working*

- bundle

*code highlights using coderay*

- bundle
- rake searchkick:reindex CLASS=Snippet

*searching working*

- bundle

*typeahead working*

- rails g mailer CommentsMailer create
- bundle

*mailing working*
