## Collection of overwritten Hanami 1.3.5 files

Ruby 3 folder contains Hanami 1.3.5 files tweaked to support Ruby 3 syntax.
This is different in the sense that we need to keep some Hanami 1.3 files in parallel
of updated versions of them.

We have renamed old DRY -> `RDY` and stored in `Kaligo/rdy` repository, so we can install newer versions of those libs in parallel. In order to do so, we need to kopy some of the Hanami files that depend on deprecated DRY gems and change them to use `RDY`

### Examples

- Hanami::Action::Params uses hanami-validations which uses old Dry-Validations with all the old dry-gems preventing us from gradual update. These files are updated to use RDY instead.
