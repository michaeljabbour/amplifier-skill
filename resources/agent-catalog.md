# Amplifier Agent Catalog

Comprehensive reference for all available Amplifier agents, their capabilities, and optimal use cases.

## Foundation Bundle Agents

### foundation:zen-architect

**Category:** Architecture & Design  
**Purpose:** System design, architecture planning, and code review

**Capabilities:**
- Analyze existing system architecture
- Propose refactoring strategies
- Design module boundaries
- Evaluate trade-offs between approaches
- Create migration plans

**Best For:**
- Complex refactoring projects
- New feature architecture
- System decomposition
- Technical debt assessment

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:zen-architect to analyze the payment processing system and propose a strategy to support multiple payment providers. Consider: extensibility, testing, error handling"
```

---

### foundation:modular-builder

**Category:** Implementation  
**Purpose:** Build code from specifications following modular design principles

**Capabilities:**
- Implement from architectural specifications
- Generate self-contained modules
- Follow "bricks and studs" philosophy
- Create clean interfaces

**Best For:**
- Implementing designs from zen-architect
- Building new modules from specs
- Generating boilerplate with proper structure

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:modular-builder to implement the PaymentProvider interface designed by zen-architect. Include: base class, Stripe implementation, comprehensive tests"
```

---

### foundation:bug-hunter

**Category:** Debugging  
**Purpose:** Systematic debugging with hypothesis-driven approach

**Capabilities:**
- Hypothesis generation and testing
- Root cause analysis
- Error trace analysis
- Fix verification

**Best For:**
- Mysterious errors without obvious cause
- Intermittent failures
- Complex debugging requiring systematic approach

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:bug-hunter to investigate: TypeError in user serialization that only occurs with certain Unicode characters. Start with hypothesis testing around encoding"
```

---

### foundation:test-coverage

**Category:** Quality  
**Purpose:** Test coverage analysis and gap identification

**Capabilities:**
- Analyze existing test coverage
- Identify critical gaps
- Suggest specific test cases
- Prioritize testing efforts

**Best For:**
- Pre-release quality checks
- New module validation
- Coverage improvement planning

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:test-coverage to analyze src/auth/ module. Identify: untested edge cases, missing error scenarios, integration test gaps"
```

---

### foundation:security-guardian

**Category:** Security  
**Purpose:** Security review and vulnerability assessment

**Capabilities:**
- OWASP Top 10 checks
- Secret detection
- Input validation review
- Authorization flow analysis
- Dependency vulnerability scanning

**Best For:**
- Pre-deployment security review
- Authentication/authorization changes
- API endpoint security
- Third-party integration review

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:security-guardian to review the new OAuth2 integration. Check for: token handling, scope validation, CSRF protection, secure storage"
```

---

### foundation:explorer

**Category:** Analysis  
**Purpose:** Deep codebase reconnaissance and analysis

**Capabilities:**
- Map code architecture
- Trace data flows
- Document implicit patterns
- Find usage patterns

**Best For:**
- Understanding unfamiliar codebases
- Onboarding to new projects
- Finding all usages of a pattern
- Documenting undocumented code

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:explorer to map how events flow from user actions to database writes. Document the complete event handling architecture"
```

---

### foundation:web-research

**Category:** Research  
**Purpose:** Web search and information synthesis

**Capabilities:**
- Search documentation
- Find code examples
- Research libraries
- Synthesize multiple sources

**Best For:**
- Looking up API documentation
- Finding implementation examples
- Researching best practices
- Comparing library options

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:web-research to research WebSocket reconnection strategies. Find: best practices, library comparisons, production-ready patterns"
```

---

### foundation:git-ops

**Category:** Operations  
**Purpose:** Git and GitHub operations with safety protocols

**Capabilities:**
- Create well-formatted commits
- Manage branches
- Create and manage PRs
- Resolve conflicts
- Multi-repo operations

**Best For:**
- Any git operations (ALWAYS delegate)
- PR creation with proper formatting
- Complex merge scenarios

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:git-ops to create a PR for the authentication refactor. Include: detailed description, breaking changes section, migration notes"
```

---

### foundation:integration-specialist

**Category:** Integration  
**Purpose:** External service integration and API connections

**Capabilities:**
- Design integration architecture
- Handle authentication flows
- Manage API versioning
- Error handling patterns

**Best For:**
- Third-party API integration
- Webhook implementations
- Service-to-service communication

**Example:**
```bash
amplifier run --bundle foundation "Use foundation:integration-specialist to design integration with Stripe's payment API. Consider: idempotency, webhook handling, error recovery"
```

---

## Ecosystem Agents

### amplifier:amplifier-expert

**Category:** Ecosystem  
**Purpose:** Amplifier ecosystem knowledge and guidance

**Capabilities:**
- Explain Amplifier architecture
- Guide bundle creation
- Recommend patterns
- Troubleshoot Amplifier issues

**Best For:**
- Learning Amplifier
- Creating custom bundles
- Understanding module patterns

---

### recipes:recipe-author

**Category:** Workflow  
**Purpose:** Create and validate workflow recipes

**Capabilities:**
- Design multi-step workflows
- Validate recipe YAML
- Add approval gates
- Optimize recipe patterns

**Best For:**
- Creating repeatable workflows
- Multi-agent orchestration
- Approval-gated processes

---

### recipes:result-validator

**Category:** Validation  
**Purpose:** Objective pass/fail assessment

**Capabilities:**
- Binary validation
- Rubric-based scoring
- Evidence-based verdicts

**Best For:**
- Quality gates in workflows
- Automated validation
- Compliance checking
