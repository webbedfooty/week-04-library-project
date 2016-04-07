# Library Manager

We have several libraries, each of which have several staff members and
several books. We also have several patrons, who can access any library.

Our goal, then, is to build a manager for our library system.

# Setup

After forking and cloning the repository, you'll need to run `bundle install`
and `rake db:create`.  There are no migrations yet, so you'll need to write and
run those on your own.

Once you've created your first commit, create a pull request on the [main
repository](https://github.com/star-city-code-school/week-03-library-project) so
I can see your work as you progress.

We're going to build on this project for the next 10 days or so, so it's
important that you do it correctly.

# Business Domain Needs

1. Libraries should have a branch name, an address, and a phone number. All of
   which must be present and unique.
2. Staff members should have a name and an email address (the email address must
   be unique), and should be assigned to a branch. You should be able to
   re-assign staff members from one branch to another. A user should be able to
   look at a library and see the staff members, and look at a staff member to see
   which library they work at.
3. Books should have a title, an author, and an ISBN. Books should be assignable
   to a home library (though can be re-assigned to another library) and should
   be check-out-able by patrons. A user should be able to look up a book and see
   whether it's available or checked out, and if it's checked out, by whom.
4. Patrons should have a name and a unique email address. Patrons should be able
   to check out books from any library.Start by assuming that patrons can only
   check out or return one book at a time (and have no restriction on how many
   total books they can check out). A user should be able to look up a patron
   and see what books they have checked out, if any.
5. We need a clean driver that we can use, in regular and predictable fashion,
   to interact with our various records. This means that each type of record
   needs, at bare minimum:
   + an index (this is your default)
   + a way to make new records
   + a way to view individual records
   + a way to edit individual records
   + a way to destroy records

# Project Needs

1. Come up with a plan of attack, including a general expected order of
   execution, database schema (include attribute names and data types), and
   relationships. Do your best to isolate features. If you want to, you can go
   the "agile" route wherein you build out a feature to the point where it is
   usable from the interface before you go forward, or you can separate your
   models phase and your driver phase.
2. Use feature branches, issues, Waffle, etc., to plan your work
3. Do not do any work on the master branch
4. All of your models have tests for validations as well as any custom methods
   that don't save to the database. Do not save to the database (either by
   calling `save` or `create` or `update_attributes`) in your tests.
5. Make use of built-in ActiveRecord validations and associations. Do not write
   your own validators or relationships unless you need to.
6. All of the relationships here are one-to-many.
7. All classes should have documentation about their attributes. All methods you
   write should be documented. In addition, if you add any special features, you
   need to document them.
8. All of your models belong in _lib/_. All of your tests belong in _tests/_.
   `main.rb` belongs in the root of your project directory. Migrations belong in
   _db/migrate/_. When in doubt, follow the convention we set up with the Bug
   Tracker.
9. Your model methods should be *silent*, that is, they should do no output.
   They can (and will) return values, but they should do no output and should
   not prompt for input.

# Extensions

1. Make it so that patrons can only check out up to three books at a time. How
   would you do this? Can you use built-in validators, or do you need to write
   your own methods to control this?
2. [Validate the
   ISBN](https://en.wikipedia.org/wiki/International_Standard_Book_Number#ISBN-13_check_digit_calculation).
   Write your own validator methods (you can do this) to make use of `.valid?`.
3. After you've written the ISBN validation by hand, try out the [ActiveModel
   ISBN validator](https://github.com/zapnap/isbn_validation). You'll have to
   figure out how to make it work.
3. Library patrons want more detailed information. Give a book a status: it can
   be *aviailable*, *checked out*, or *returned and waiting to be filed* (come
   up with your own ways to phrase this). Upon being returned by a patron, a
   book needs to be re-shelved by a staff member.
4. Library Analytics are real and here! Find a way to keep track of the number
   of times a book has been checked out.
5. Create a `seeds.rb` file that checks to see if any records exist, and if not,
   auto-populates the database with records of the varying types.
6. Add in tests for methods that require you to save records. In those tests,
   call `.destroy` on those records so they are not preserved. Your tests should
   still be self-contained.
7. Do some research into *static code analysis* with CodeClimate. Set up your
   project so that your pull requests are analyzed by CodeClimate. You should
   only need the free plan for this.
8. Create a book club: a given book club takes place at a library, features a
   book, and is attended by many patrons. Patrons can only belong to one book
   club at a time. Multiple book clubs can happen at a library, and multiple
   book clubs can be about the same book.
9. For your book club, add in a facilitating staff member. Staff members should
   only be able to facilitate book clubs at their branch.
10. **Advanced**: We want our staff to be able to belong to more than one branch
    at a time (some staff members split branches). Research *many-to-many*
    relationships and replace the one-to-many relationship between staff and
    library branches with a many-to-many relationships.
