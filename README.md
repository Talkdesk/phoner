# Phoner
Parsing, validating and creating phone numbers

## Install
You can install the phone library as a gem
````
gem install phoner
````

## Difference with `phone`
* Rename the gem to phoner
* Use `active_support`
* Proper packaging

## Initializing
You can initialize a new phone object with the number, area code, country code and extension number
````
Phoner::Phone.new('5125486', '91', '385')
````
or
````
Phoner::Phone.new(:number => '5125486', :area_code => '91', :country_code => '385', :extension => '143')
````

## Parsing
You can create a new phone object by parsing from a string. Phoner::Phone does it's best to detect the country and area codes:
````
Phoner::Phone.parse '+385915125486'
Phoner::Phone.parse '00385915125486'
````

If the country or area code isn't given in the string, you must set it, otherwise it doesn't work:
````
Phoner::Phone.parse '091/512-5486', :country_code => '385'
Phoner::Phone.parse '(091) 512 5486', :country_code => '385'
````

If you feel that it's tedious, set the default country code once (in your config/environment.rb):
````
Phoner::Phone.default_country_code = '385'
Phoner::Phone.parse '091/512-5486'
Phoner::Phone.parse '(091) 512 5486'
````
Same goes for the area code:
````
Phoner::Phone.parse '451-588', :country_code => '385', :area_code => '47'
````
or
````
Phoner::Phone.default_country_code = '385'
Phoner::Phone.default_area_code = '47'
````

````
Phoner::Phone.parse '451-588'
````

### Automatic country and area code detection
Like it's stated above, Phone does it's best to automatically detect the country and area code while parsing. Do do this,
phone uses data stored in `data/countries.yml`.

Each country code can have a regular expression named `area_code` that describes how the area code for that
particular country looks like.

If an `area_code` regular expression isn't specified, the default, `Phoner::Phone::DEFAULT_AREA_CODE` (correct for
the US) is used.

## Validating

Validating is very relaxed, basically it strips out everything that's not a number or '+' character:
````
Phoner::Phone.valid? 'blabla 091/512-5486 blabla'
````

## Formatting
Formating is done via the `format` method. The method accepts a `Symbol` or a `String`.

When given a string, it interpolates the string with the following fields:

* %c - country_code (385)
* %a - area_code (91)
* %A - area_code with leading zero (091)
* %n - number (5125486)
* %f - first @@n1_length characters of number (configured through Phoner::Phone.n1_length), default is 3 (512)
* %l - last characters of number (5486)
* %x - the extension number

````
pn = Phoner::Phone.parse('+385915125486')
pn.to_s # => "+385915125486"
pn.format("%A/%f-%l") # => "091/512-5486"
pn.format("+ %c (%a) %n") # => "+ 385 (91) 5125486"
````

When given a symbol it is used as a lookup for the format in the `Phoner::Phone.named_formats` hash.
````
pn.format(:europe) # => "+385 (0) 91 512 5486"
pn.format(:us) # => "(234) 123 4567"
pn.format(:default_with_extension) # => "+3851234567x143"
````

You can add your own custom named formats like so:
````
Phoner::Phone.named_formats[:short] = '%A/%n1-%n2'
pn.format(:short) # => 091/512-5486
````

## TODO
Parse testing for different countries.

Currently tested on:
[AF] Afghanistan
[AL] Albania
[AR] Argentina
[AT] Austria
[AU] Australia
[BA] Bosnia and Herzegovina
[BD] Bangladesh
[BE] Belgium
[BG] Bulgaria
[BO] Bolivia
[BR] Brazil
[BT] Bhutan
[BY] Belarus
[BZ] Belize
[CA] Canada
[CR] Costa Rica
[CY] Cyprus
[CZ] Czech Republic
[DE] Germany
[DK] Denmark
[DZ] Algeria
[EC] Ecuador
[EE] Estonia
[EG] Egypt
[ET] Ethiopia
[FI] Finland
[FR] France
[GB] United Kingdom
[GE] Georgia
[GH] Ghana
[GR} Greece
[GU] Guam
[GT] Guatemala
[GY] Guyana
[HR] Croatia
[HU] Hungary
[IL] Israel
[IN] India
[IR] Iran
[KE] Kenya
[LK] Sri Lanka
[NG] Nigeria
[NL] Netherlands
[NO] Norway
[NP] Nepal
[PH] Philippines
[PK] Pakistan
[QA] Qatar
[RS] Serbia
[SA] Saudi Arabia
[SE] Sweden
[SI] Slovenia
[SV] El Salvador
[TO] Tonga
[UA] Ukraine
[US] United States
[ZA] South Africa
[ZW] Zimbabwe

## Contributing

More testing is needed to add support for missing countries, and improve support for tested countries. In many cases only minimal testing is done on area codes, local number formats and number length where more exact matching is possible.

The best places to start is to read through the country tests and `data/phone_countries.rb`

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors
Tomislav Carr, Don Morrison, Michael Squires, Todd Eichel (Fooala, Inc.), chipiga, Etienne Samson, Luke Randall, Wesley Moxam
