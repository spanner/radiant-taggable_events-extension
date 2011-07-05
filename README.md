# Taggable Events

This little extension combines [taggable](https://github.com/spanner/radiant-taggable-extension/) and the [event_calendar](https://github.com/radiant/radiant-event_calendar-extension/) to add event tags, tag clouds and faceted search to the event calendar and (if installed) event map.

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