# Chef Introduction

This cookbook gives a short introduction to Chef and gives a working
example with ServerSpec and ChefSpec tests.

## Rationale

This project was written with two goals in mind:

* To introduce people to testing with Chef immediately.  I have worked
  with several people who wrote Chef recipes without being aware of
  Chef's tools for testing and TDD, which is possible with the Chef DK
  straight out of the box.
* To give people a running example covering the rock-bottom Chef
  basics.  It's much easier to hack on a working example, even if it's
  a toy project.

This is intended as a (very) brief and wide introduction to a range
of Chef topics:

* Chef resources
* Test Kitchen and ChefSpec tests
* attributes
* templates
* Berkshelf

If you check out this project, inspect the code, and maybe hack around
on it a bit, you'll have a sense of what Chef can do.  At that point,
I **strongly recommend** that you proceed with [the official Chef
tutorials](https://learn.chef.io/tutorials/), which are very good.

I've used this project as part of a 90-minute in-house
workshop/discussion on Chef, accompanied by [a short slide
deck](https://drive.google.com/file/d/0B-3pEbU0sdHxYjZHcGVscTQtMm8/view?usp=sharing).

If this is useful for you or your team, please use it.  Good luck!

## Getting started

* Get the [Chef DK](https://downloads.chef.io/chef-dk/)
* Clone this repo

## Using this project

This project gives an incremental introduction to a range of Chef
topics.  If you check out master, you can see the changes that are
added as at each commit, e.g.:

```
$ git log master --oneline --reverse

a03dd0f Root commit.
cda22d3 README
cfeb92f Initial generated cookbook (boilerplate).
9811543 Add file and content, 'kitchen converge' fails.
7ed0d12 Add directory, 'kitchen converge' succeeds.
ae3eddd Add ServerSpec test.
cfdb207 Add ChefSpec test.
... [snip] ...
```

You can view a commit to see what changed:

```
$ git show ae3eddd
...

--- a/test/integration/default/serverspec/default_spec.rb
+++ b/test/integration/default/serverspec/default_spec.rb
@@ -3,7 +3,9 @@ require 'spec_helper'
 describe 'chef_intro::default' do
   # Serverspec examples can be found at
   # http://serverspec.org/resource_types.html
-  it 'does something' do
-    skip 'Replace this with meaningful tests'
+
+  describe file('/mydir/hello.txt') do
+    it { should exist }
+    it { should contain(/Hello/) }
   end
 end

```

Once you've cloned the repo, find the commit you want with `git log
--oneline`, check out a branch as at that commit, and try running it
in Test Kitchen, or hacking at the code:

```
$ git log --oneline --reverse
...
85a10cd Add user resource.
...

$ git checkout 85a10cd -b my_branch
Switched to a new branch 'my_branch'

$ git log -n 1 --oneline
85a10cd Add user resource.

$ kitchen verify
-----> Starting Kitchen (v1.5.0)
...[snip]...
       chef_intro::default
         File "/mydir/hello.txt"
           should exist
           should contain /Hello/
           should be owned by "jsmith"

       Finished in 0.12216 seconds (files took 0.36483 seconds to load)
       3 examples, 0 failures

       Finished verifying <default-ubuntu-1404> (0m18.42s).
-----> Kitchen is finished. (1m50.05s)

$
```
