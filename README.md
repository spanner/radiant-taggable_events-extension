# Taggable Events

This little extension combines [taggable](https://github.com/spanner/radiant-taggable-extension/) and the [event_calendar](https://github.com/radiant/radiant-event_calendar-extension/) to add event tags, tag clouds and faceted search to the event calendar and (if installed) event map.

## Compatibility

The 2.x releases are meant to be used with radiant v1. They may work with older releases if you install the dependencies first.

## Installation

Install the gem:

	sudo gem install radiant-taggable_events-extension

and add it to your application's Gemfile:

	gem radiant-taggable_events-extension, '~>2.0.0'
	
You shouldn't need to specify extension load order since, as it happens, `taggable_events` is alphabetically later than `event_calendar` and `taggable`, which need to load before this does. 

## Examples

This extension is mostly invisible: it adds in small ways to the existing behaviour of the event_calendar controllers, so that for example the existing date-period faceting block that is displayed by:

	<r:content part="faceting" />

Now includes tagging facets. If you add add this to the calendar layout:

	<events:tag_cloud />

Then the usual cloud of tags will be displayed, and in a calendar view they will add to the filter set. Similar reducing links will be appended to each listed event.

## Author & Copyright

* William Ross, for spanner. will at spanner.org
* Copyright 2009-11 spanner ltd
* released under the same terms as Rails and/or Radiant