# Admin Nav

### A simple admin navigation bar for your Rails app.

This gem enables you to apply a simple navigation bar at the top of your 
website in which you can insert any link actions you need, styled as buttons.

I originally intended this to be used as an administration navigation UI (hence the name) that
would appear after logging into a Rails app, but it could certainly be used
in the public side of your app if it makes sense. This gem merely gives you
a few helper methods, some icons, and a stylesheet for handling the rendering
of these elements in your views. Whether or not you use them behind a login
is up to you ;)


## Installation

Add this line to your application's Gemfile:

    gem "admin_nav", :git => "git://github.com/robmclarty/admin_nav.git"

And then execute:

    $ bundle


## Usage

Four helper methods are included which are added to ActionView when your Rails
app is instantiated:

- `admin_nav`
- `global_admin_link_to`
- `local_admin_link_to`
- `set_admin_message` (unfinished as of June 7)

You can use these helper methods to generate the "panel" where your menu will appear
as well as add link/buttons to that panel on either the left or right side. I decided,
according to the conventions I've seen used on most websites, that the right side is
where "global" links get displayed, and the left side is where "local" links are displayed.
The difference, to me, is that global links are site-wide (e.g., logout, account settings, etc.)
whereas local links have to do with the current page you're looking at (e.g., edit, save, manage, etc.).

The `set_admin_message` is intended to act as a container for any alert messages you
might want to display (e.g., perhaps using Rails' flash), but this is currently not
in progress and probably shouldn't be used yet.

It is recommended that you choose an icon for each button, not only to make your buttons
more easily identifiable, but also so that your nav panel will work on smaller screens
(like a phone). The included stylesheet will responsively change the buttons from icon+label
to just icon on small screens so that all your navigation will still fit in smaller contexts 
(read more about icons below).

### admin_nav

To setup your nav panel, you would invoke the `admin_nav` helpler method inside your main
layout file, anywhere underneath your main `yield` statement. 

    <%= admin_nav %>

The reason for this is that
the nav panel contains `content_for` blocks where any links added using the other methods
will be gathered and rendered in place. In order for these links to show up in your nav
panel, you will need to make sure your `local_admin_link_to` and `global_admin_link_to`
commands are done *above* the `admin_nav` command (they need to come first, and be stored
in `content_for`). This way, you can add links anywhere in your views and they will be
rendered in the main `yield` before the nav panel and everything should be peachy.

Don't worry about positioning. The admin nav panel uses `position: fixed` so that it will
appear at the top of the page, on top of any existing UI elements.

NOTE: A convenience CSS class is included called `admin-nav-offset` that you can use to add
padding to the top of any element you need that is exactly the same height as the admin
nav panel. Usually I apply this to the `<body>` tag to push all the content down, conditionally
when I am using the `admin_nav` function in my views (e.g., only when a user is logged in). I've
kept this separate and up to you to implement so you're free to include it as you see fit.

### global_admin_link_to

Add any global links/buttons you want anywhere you like, above the `admin_nav` call
you just made. These links will be rendered on the right side of the nav panel. 
This would usually be done in your layout file (since these are site-wide buttons)
but it's up to you. The helper acts like a single-line `link_to` command (in fact it uses
`link_to` inside).

    <%= global_admin_link_to 'Logout', logout_path, :class => 'logout' %>

I should mention that both of the link helper methods can display icons inside their link areas
based on the class you pass to them (see list of icons below).

### local_admin_link_to

Just like the global links/buttons, except these will be added to the left side of the panel
instead of the right side.

    <%= local_admin_link_to 'Edit', edit_post_path(@post), :class => 'edit' %>

You can also pass in other html options you want to add like ids.

    <%= local_admin_link_to 'Edit', edit_post_path(@post), :class => 'edit', :id => 'edit-button' %>

### set_admin_message

(to be completed)

### Example

If you want to use this nav panel only for administration purposes (e.g., it should appear
only when a user has logged into your app) you might implement it like this in your main
layout file.

```
<%= yield %>

<% if current_user? %>
  <%= global_admin_link_to 'Users', users_path, :class => 'user' %>
  <%= global_admin_link_to 'Settings', settings_path, :class => 'settings' %>
  <%= global_admin_link_to 'Logout', logout_path, :class => 'logout' %>
  <%= admin_nav %>
<% end %>
```

This sets up some global links before the main `admin_nav` call only if there is a current
user logged in. Note that the order of the `global_admin_link_to` calls is the order the
buttons will appear in from left to right.

## Icons

There is a finite list of icons you can use for your buttons to make them a little bit
easier to identify. These are parcelled up into both regular and so-called retina bitmap
files. The stylesheet includes classes you can pass to the link helper functions above to 
apply the icon you want (and responsively switch to high-pixel-density versions for screens
that support them).

Currently, the following icons are available for use (the full Entypo set will be supported soon),
listed by their exact class name (as you would pass them to the helper functions):

- star
- edit
- remove
- new
- delete
- logout
- cancel
- settings
- more
- save
- user


## Credits

This gem was created by me, [Rob McLarty](http://robmclarty.com), extracted from other
projects where I re-used these functions over and over (now you can too).

All icons (except for the "eject"/"logout" icon which I made myself) are from
[Entypo](http://www.entypo.com) v.2.0, by [Daniel Bruce](http://danielbruce.se/).
