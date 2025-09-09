## ACES Documentation

[![CLA assistant](https://cla-assistant.io/readme/badge/ampas/aces-docs)](https://cla-assistant.io/ampas/aces-docs)

This repository contains the code used to generate the ACES documentation website hosted at [https://docs.acescentral.com](https://docs.acescentral.com).

The docs at the above link should be considered the most up-to-date. Prior to this online documentation system, PDFs were rendered from LaTeX source. The LaTeX source remains available in the history of this repository but should be considered out of date unless explictly linked to by this website.

## License
This project is licensed under the terms of the [LICENSE](./LICENSE.md) agreement.

## Contributing
Thank you for your interest in contributing to our project. Before any contributions can be accepted, we require contributors to sign a Contributor License Agreement (CLA) to ensure that the project can freely use your contributions. You can find more details and instructions on how to sign the CLA in the [CONTRIBUTING.md](./CONTRIBUTING.md) file.

The ACES Docs website is built using `mkdocs` with the `Material for Mkdocs` theme, generating the HTML version from Markdown text files. The site configuration, including navigation, is managed through the `mkdocs.yml` file.

To update existing content, simply modify the relevant `.md` file. For new pages, create a `.md` file and add a reference to it in the `nav:` section of the `mkdocs.yml`. Changes are automatically deployed through a [GitHub Action](.github/workflows/main.yml) when commits are made to either the `main` or `dev` branches. Updates on `main` appear on [https://docs.acescentral.com](https://docs.acescentral.com), while `dev` branch updates appear on [https://draftdocs.acescentral.com](https://draftdocs.acescentral.com).

Before submitting a pull request, preview your changes locally using the included `Dockerfile`. Ensure Docker is installed, navigate to the repository directory in your terminal, and execute `docker compose up`. Your changes will be viewable at [http://0.0.0.0:8000](http://0.0.0.0:8000).

Once satisfied with your updates, proceed to submit a pull request.

## Support
For support, please visit [ACESCentral.com](https://acescentral.com)
