---
title: "Shipping an iOS App with Claude Code"
excerpt_separator: "<!--more-->"
categories:
  - ai-development
  - ios-development
tags:
  - ai-development
  - ios-development
  - claude-code
  - generative-ai
---

## Motivation and Problem Statement

Agentic developer tooling is evolving rapidly. As a software engineering manager with limited uninterrupted coding time, I was eager to explore how these tools might accelerate solo development. I also wanted to understand how they could help me better support my team.

I live in San Francisco and have a personal passion for discovering the city's lesser-known parks. During the pandemic, I found solace walking long distances across neighborhoods, discovering hidden green spaces. This inspired me to build an iOS app — [**Fog & Fern**](https://fogandfern.app) — to track, explore, and revisit these parks more systematically.

This project was also an experiment: Could I use generative AI tooling to quickly build a real, shippable iOS app on a tight schedule?

## Tooling Background and Initial Setup

My prior exposure to AI tools includes extensive ChatGPT use for personal queries, Windsurf for frontend prototyping, and some passive usage of Cursor. Recently, Cloud Code began receiving buzz, so I chose it as my primary tool for this project.

My earlier Windsurf experience taught me that while LLMs can rapidly scaffold code, they struggle without boundaries. They often generate monolithic files and lack resilience to code changes, especially without tests. With this in mind, I aimed to:

- Emphasize upfront planning  
- Break the app into manageable parts  
- Use LLMs with defined roles for refinement (e.g., security auditor, iOS expert)

## Scoping the MVP with AI

I began by telling ChatGPT (so far, my default generative AI tool) the app’s core idea: display all San Francisco parks and allow marking them as visited. The initial scope included broader goals like social sharing, note-taking, and gamification, but I consciously trimmed these to focus on shipping an MVP fast.

I first prompted ChatGPT to generate a product requirements document. While it included extraneous business elements (e.g., market segmentation, monetization strategies), through my guidance it also generated a structured approach to the product with defined milestones for the core features.

Next, I worked with ChatGPT to create a technical architecture, providing preferences for technologies like SwiftUI, SwiftData, MapKit, and CloudKit. While the output was oversized, the exercise was useful because it meant core coding practices, tooling, and overall architecture were baked into the context and available to the system as I prompted it to make refinements throughout the project.

Finally, I had it mock out wireframes. The first draft of these mocks were actually quite good, and this closed the loop on my planning phase.

## Infrastructure and Dev Environment

I reactivated my long dormant Apple Developer account, secured a domain, and refreshed my knowledge of Xcode and the general Apple development ecosystem. I'm not an iOS developer, having hardly any knowledge in this area, but the AI's assistance helped me clear the initial hurdles quickly.

With tooling in place, I purchased Claude Pro and began development.

## Generating the First App Version with AI

I fed Claude the product requirements, wireframes, and technical architecture and asked it to generate an initial iOS project. From there, I iteratively refined UI components, state models, and core business logic — all through conversational prompts.

Tests weren’t written at this stage. Instead, I focused on MVP functionality:

- Obtaining and normalizing the parks data from the SF Parks API
- Viewing parks on a map using MapKit
- Marking parks as visited using SwiftData

I hit usage limits during this phase of the project, but largely used those limits as excuses to take a break and enjoy some of the beautiful weather we've been having lately. At this point, I just couldn't justify purchasing the Max tier, though I was sorely tempted.

During this development, and especially when I hit usage limits, I used that opportunity to use ChatGPT Desktop's built-in support for sharing tab context to review and ask questions about the codebase. This was invaluable in helping me understand framework usage and APIs, as well as Swift syntax and language features. 

The term "vibe coding" has become popular lately, but I try to shy away from it because I believe people associate it with a lack of understanding of the code that is being written. I instead prefer to think of this as pair programming with a machine. I believe the approach of being less aware of the code is valid in some use cases: rapid prototypes, simple scripts, and one-off applications. But it's certainly not valid in real-world business settings where bad code can have legal or financial implications. In my case, I had a goal of moving quickly, but I also wanted to learn about this ecosystem, so I took the opportunity to learn as much as I could within my time constraint. As a result, I have much more confidence that I could build another app without AI-assisted tooling should I have a need to do so in the future.

## Code Review and Auditing with AI Agents

Once the app had the basic functionality, I used separate Claude agents to audit the code:

- **Security Reviewer:** Checked for vulnerabilities and outdated practices  
- **iOS Development Expert:** Recommended modern Swift, SwiftUI, and iOS APIs

No security issues were identified, but some recommendations were made to use more modern iOS development practices. These reviews improved the codebase, even if no critical issues were found. 

I think this pattern of having separate instances of the agents approach the code with fresh context can be helpful, but I would have to experiment more to know how strongly I'd make that recommendation. These tools are evolving and improving so rapidly that maybe this won't even be helpful in the future.

## Incremental Feature Development

I continued development by layering in small, testable additions:

- CloudKit syncing for park visit persistence across devices  
- Filtering mechanisms for the map view 
- Simple UI polish  

I also added in-app purchases to allow for donations simply out of curiosity around how they work.

TestFlight allowed me to push internal builds to my own device quickly (in addition to the local testing I was already doing). I later configured external testers via App Store Connect, catching a key issue with a production CloudKit schema mismatch through early user testing.

## Generating Tests with AI and Publishing the App

Initially, I asked Claude to generate all tests—but this approach failed. Claude struggled to resolve some errors autonomously, even with MCP-enabled simulator access.

Instead, I pivoted to writing and testing smaller code snippets, gradually expanding unit coverage. Once those were stable, I layered in integration and UI tests. Along the way, I:

- Configured test parallelization separately for local vs cloud builds (disabled locally to avoid memory pressure on my meager 8GB, M1 MacBook Air)  
- Created separate test plans for CI (Xcode Cloud) and local (sequential) execution


It was somewhere during this phase of the project that I caved and upgraded to Claude Max. Since upgrading, I only hit usage limits once with a very modest one hour wait time until I could resume. This tier seems to be the right one for more extended development sessions.

During this phase of the project, I was able to parallelize some tasks with multiple instances of Claude, including:
- Multiple streams of feature development
- Test creation and debugging
- Supportive scripting and new feature experimentation

I'm very curious to expand on this thread in future projects, perhaps by using multiple checkouts of the repo or git worktree to more seamlessly allow for parallelized development.

Apple’s submission process required a privacy policy and support contact, so while Claude was iterating on the tests, I spun up a simple GitHub Pages site tied to a custom domain I had purchased when I started the project.

Finally, I felt good about the features in the MVP and submitted for App Store approval. After about two days, the app was approved and published.

## Reflections and Learnings

The LLM tools significantly reduced friction—especially during research, debugging, and scaffolding. I likely wouldn’t have attempted this solo build without them. That said, I learned:

- Context management is critical. Overly verbose requirements docs can derail AI output.  
- MVP scoping should be even more aggressive. I should’ve started with a simple, CloudKit-free map and layered in features post-launch.  
- AI tools work best with modular code and small tasks.
- Parallel tasks will be key to enhanced productivity. Multiple agents can modify code in separate modules, while others write tests, create scripts, or help write documentation.

## Final Thoughts on AI-Augmented Development

These tools won’t replace experienced engineers anytime soon. They *will* drastically augment productivity, especially in early-stage prototyping and supportive tool development (ie, scripts, one-off applications, etc). There’s still critical value in understanding:

- Architecture tradeoffs  
- Debugging edge cases  
- Testing strategies  
- Deployment requirements

The craft isn’t dying—it’s evolving. We’re moving up the abstraction ladder. Just as assembly gave way to higher-level languages, LLMs are removing boilerplate and unlocking creative space for problem-solving.

For engineers, this means:

- Learn how to orchestrate AI effectively  
- Stay hands-on with system design, testing, and optimization  
- Embrace the tools, but continue honing your judgment

[**Fog & Fern**](https://fogandfern.app) was a fast, rewarding experiment that showed just how powerful LLM-assisted development can be when guided by an experienced developer with strong product instincts.