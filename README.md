ACES Documentation
==================

[![CLA assistant](https://cla-assistant.io/readme/badge/ampas/aces-docs)](https://cla-assistant.io/ampas/aces-docs)
[![CC BY 4.0][cc-by-shield]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg


Introduction
------------

This repository contains the files and code used to generate the documentation pages for the ACES project.

The docs at [https://docs.acescentral.com](https://docs.acescentral.com) are built from the head of the `main` branch and should be considered the most up-to-date. 

Contributing
------------
We welcome contributions of any kind to our documentation. This includes pull requests that are ready to be merged in immediately, unformatted content, or even just an idea for a page that you'd like to have added to the documentation.

If you have a specific idea or a request for a particular topic that you would like to see explained, please [create an issue](https://github.com/ampas/aces-docs/issues) so that we can track and prioritize new additions to the documentation. 

### For those with basic developer experience
The ACES Documentation website is built using [MkDocs](https://www.mkdocs.org) using the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme to generate HTML from the Markdown text files. The site configuration, including navigation, is managed through the `mkdocs.yml` file. 

Changes are automatically deployed through a [GitHub Action](.github/workflows/main.yml) when commits are made to the `main` branch. Updates on `main` appear on [https://docs.acescentral.com](https://docs.acescentral.com).

To update existing content, simply modify the relevant `.md` file. 

To add new pages, create a `.md` file and add a reference to it in the `nav:` section of `mkdocs.yml`.

#### Previewing
Using Docker with the included `Dockerfile`, you can build a local version of the docs to preview your changes locally to make sure they appear exactly as you want before submitting your pull request. 

1.  Ensure Docker is installed and running. 
2.  In your terminal, navigate to the local clone of the `aces-docs` repository. 
3.  Type the command: `docker compose up` 
    This will spin up a Docker container for aces-docs. 
4.  If the build completes and the Docker container is running, a local version of the doc site will then be viewable at [http://0.0.0.0:8000](http://0.0.0.0:8000).
5.  The doc site should then reload the html whenever changes are made to the files and then saved. Adjust your files, save, and preview the changes immediately until you are satisfied.

Once satisfied with your updates, proceed to submit a pull request.

### For those less Github savvy
Even if you are "not a programmer" or just lack comfortability with contributing through the Git workflow, you can still contribute!

All documentation content is generated from simple Markdown text files. This means it is easy to contribute even if you are intimidated by the overhead of forking, building a local copy, and then submitting back a pull request.
Just send the content-including any text and any accompanying images or graphics-and we can help you get it formatted into Markdown that will build properly for the documentation.

### Contributor Licence Agreements
Before any contributions can be accepted, contributors must sign a Contributor License Agreement (CLA) to ensure that the project can freely use your contributions. You can find more details and instructions on how to sign the CLA in the [CONTRIBUTING.md](./CONTRIBUTING.md) file.


License
-------
ACES Documentation is licensed under the 
[Creative Commons Attribution 4.0 International License](./license).


Support
-------
For support on ACES, please visit [ACESCentral.com](https://acescentral.com) or on the [\#ACES channel on the ASWF Slack](https://academysoftwarefdn.slack.com/archives/C09949SK82Y)
