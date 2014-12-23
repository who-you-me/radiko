radiko Cookbook
===================

Chef Cookbook for recording Radiko programs

Requirements
------------

- `system`
- `ntp`
- `yum-epel`
- `yum-repoforge`
- `apt`

Attributes
----------

#### radiko::install
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['radiko']['user']</tt></td>
    <td>String</td>
    <td>Unix user for Radiko</td>
    <td><tt>radiko</tt></td>
  </tr>
  <tr>
    <td><tt>['radiko']['home_dir']</tt></td>
    <td>String</td>
    <td>Scripts for radiko will be installed in it</td>
    <td><tt>/var/radiko</tt></td>
  </tr>
</table>

#### radiko::record
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['radiko']['save_to']</tt></td>
    <td>String</td>
    <td>Recorded mp3 files will be saved in it</td>
    <td><tt>/var/radiko/rec</tt></td>
  </tr>
  <tr>
    <td><tt>['radiko']['programs']</tt></td>
    <td>Array</td>
    <td>Programs to record. See attributes/default.rb</td>
    <td>See attributes/default.rb</td>
  </tr>
</table>

