# alireza0.github.io

## About the website
The site is built with [Hugo](https://gohugo.io/) and uses the [Docsy](https://www.docsy.dev/) theme.

### Website content
The website contains everything presented by the [alireza0 documentation website](https://alireza0.github.io/).

### Document Organization
The article content of the website is under the content directory, and the specific organizational structure is as follows:

```
	content
	└── section-one/			
	    ├── _index.md
	    └── section-one-two/ 	
	        ├── _index.md 		
	        ├── section-one-two-three-A/	
	        │   ├── _index.md
	        └── section-one-two-three-B/ 	
	            ├── _index.md 	<-- section's page 
	            ├── pageA.md  <-- "subpages"
	            └── pageB.md  <-- "subpages"
```

Each content page is organized according to the organizational structure, which is automatically combined to form the website and navigation structure

Create a folder for each chapter and its subchapters (composition menu)
`_index.md` in the folder as the main page for this chapter
The rest of the page*.md are subpages of this chapter
Each page file can edit the metadata to set the specific details of the page
More advice on how to edit pages is available on the [Hugo](https://gohugo.io/) and [Docsy](https://www.docsy.dev/) websites.

### Correspondence between directory and main menu
Folder name|Menu name
--|--
about|About alireza0
guide|Quick start
config|Configuration document
documents|Reviews
develop|Development Guide
FAQ|Frequently Asked Questions
links|Most used link

Some menus also have secondary menus, just view the content directly below them.

## Help us improve the site

###Improve website content

- You can help us improve what the alireza0 documentation site presents by modifying the documentation in this repository.

- After you add or modify, submit your modification and issue a PR to this warehouse.

## Automatic build

When the modification is successfully submitted to the warehouse or the PR is merged, the alireza0 documentation website will be automatically rebuilt

Just wait a moment for the latest rendering of the modification to be seen on the website.

## Acknowledgments
- [Hugo](https://gohugo.io/)
- [Docsy](https://www.docsy.dev/)
- Everyone who helps us improve our documentation!