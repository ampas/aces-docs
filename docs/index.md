Getting Started
====

## What is ACES
The Academy Color Encoding System (ACES) is an industry standard for managing color and digital files throughout the lifecycle of almost any media production, from motion pictures to television, video games, or immersive storytelling projects. From image capture through editing, VFX, mastering, public presentation, archiving, and future remastering, ACES ensures a consistent color experience that preserves the creators' vision. It also "future-proofs" your project and simplifies the creation of the many deliverables required by today's productions.

## Why use ACES?
ACES standardizes and simplifies color management by maintaining the color fidelity of your production at the highest level throughout production, post-production, and archiving. It simplifies camera matching in DI; improves color and workflow communication; adds reliability to the color viewing pipeline; simplifies and "future-proofs" the creation of outputs; and can help create a 'known quantity' master for the archive.

Using ACES simplifies your communications, especially in sophisticated multi-vendor workflows. When the decision to use ACES is made, there are only a few questions to be asked and answered for everyone to be on the same page. For example:

- What inputs (cameras, animation) are we expecting to use?
- Will we be managing color on set?
- What color correction and animation tools are we using?
- What are our anticipated outputs (cinema projector, streaming devices, etc.)?

Importantly, ACES is free and open-source, so dozens of companies have built it into their tools and continually innovate on top of its standardized framework.

## How to use ACES?

At a high level, you use ACES by encoding your materials using an ACES-approved Input Transform that will properly map the characteristics of your inputs into the ACES 2065-1 color space. You then use tools to keep it in one of the approved ACES working spaces (thereby preserving the fidelity of your images). Finally, you output your audience viewing masters using an ACES Output Transform to match your outputs to the specific devices your audience will be watching.

On a more granular level, you use products that have built ACES support into their hardware and software products, setting input and output parameters according to the manufacturer's instructions for ACES. Most manufacturers have a pulldown setting for ACES alongside any other proprietary color management configurations they offer.

Here is a list of ACES features that major manufacturers support:

## Contribute to ACES

### Working Group Participation

We're thrilled that you're interested in contributing to ACES.  ACES is a community project that adheres to the principles of open source. Work is primarily conducted in working groups organized by the ACES Leadership Team. These groups function as topic-specific task forces that discuss and propose solutions to well-defined problems. The formation of groups and invitations for participation are announced on [ACESCentral.com](https://www.acescentral.com), with open participation to all interested individuals. Meetings are held virtually and recorded to maximize inclusivity. In between meetings, discussions continue on the [ACESCentral.com discussion forums](https://community.acescentral.com). If you're interested in contributing to the field of color management and digital imagery, please consider participating in the discussions or joining a working group.

### Code Contributions
To maintain the legal integrity of the project's codebase, we require all contributors to sign a Contributor License Agreement (CLA).

#### Signing the CLA

- Before we can merge any of your contributions, you must sign our CLA.
- The process is simple. When you submit a pull request for the first time, you will be prompted to sign the CLA online.
- If you are contributing on behalf of your employer or if your contributions are owned by someone other than yourself (e.g., your employer), please make sure you have the right to submit the contributions under our project's CLA.

By signing the CLA, you assure the project and its users that your contributions do not infringe upon the rights of any third parties and that the project can use your contributions without legal repercussions.

If you have any questions about the CLA process, please feel free to contact a member of the ACES Team via ACESCentral.com.

#### Requirement for Signed Commits

As part of our commitment to security and the integrity of our codebase, we require all commits to be signed. This helps us ensure that contributions are actually made by the account they come from and not altered by a third party.

##### Why Signed Commits?

Signed commits provide an additional layer of security by guaranteeing that the commits are from a verified source. This is crucial for maintaining the trustworthiness of our codebase.

##### How to Sign Commits

To sign commits, you'll need to use a GPG (GNU Privacy Guard) or S/MIME (Secure/Multipurpose Internet Mail Extensions) key. If you haven't already set up a GPG key, you can follow [GitHub's guide on generating a new GPG key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key).

Once you have a GPG key, you can add it to your GitHub account. For instructions on how to do this, see [GitHub's documentation on adding a new GPG key to your account](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account).

When you have your GPG key added to your GitHub account, you can start signing your commits. If you're using the command line, you can sign commits with `git commit -S -m "Your commit message"`.

##### Verifying a Signed Commit

You can verify that your commits are signed by looking for the "Verified" label on GitHub's commit interface.

##### What if You Cannot Sign Your Commits?

We understand that in some scenarios, you might not be able to sign commits. If you find yourself in this situation, please reach out to the project maintainers for assistance.

For more detailed instructions on signing commits, you can refer to [GitHub's documentation on signing commits](https://docs.github.com/en/github/authenticating-to-github/signing-commits).

---

We appreciate your contributions to ACES, and we thank you for adhering to our signed commits policy. This policy helps us maintain the security and integrity of our codebase.

If you have any questions about this process, please feel free to contact the project maintainers.

