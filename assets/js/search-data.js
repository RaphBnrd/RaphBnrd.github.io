// get the ninja-keys element
const ninja = document.querySelector('ninja-keys');

// add the home and posts menu items
ninja.data = [{
    id: "nav-about",
    title: "about",
    section: "Navigation",
    handler: () => {
      window.location.href = "/";
    },
  },{id: "nav-projects",
          title: "projects",
          description: "List of projects, either professional or personal.",
          section: "Navigation",
          handler: () => {
            window.location.href = "/projects/";
          },
        },{id: "nav-publications",
          title: "publications",
          description: "Collection of publications.",
          section: "Navigation",
          handler: () => {
            window.location.href = "/publications/";
          },
        },{id: "nav-teaching",
          title: "teaching",
          description: "List of courses taught and materials used. (in French)",
          section: "Navigation",
          handler: () => {
            window.location.href = "/teaching/";
          },
        },{id: "nav-cv",
          title: "cv",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/cv/";
          },
        },{id: "projects-️",
          title: '🐦 🛣️ 🌲',
          description: "Studying the impact of forest roads on bird communities",
          section: "Projects",handler: () => {
              window.location.href = "/projects/birds_and_roads/";
            },},{id: "projects-️",
          title: '🐟 🪝 🌡️',
          description: "Identifying drivers of fish stocks using causality assessment framework",
          section: "Projects",handler: () => {
              window.location.href = "/projects/drivers_of_fish_stocks/";
            },},{id: "projects-",
          title: '📚 🪲 🌺',
          description: "Infography on IPBES&#39; Global Assessment Report summarizing key points (French)",
          section: "Projects",handler: () => {
              window.location.href = "/projects/infography_IPBES/";
            },},{id: "projects-",
          title: '🌿 🌍 📉',
          description: "PhD project - Estimating spatio-temporal trends of plant species using Opportunistic Citizen science data",
          section: "Projects",handler: () => {
              window.location.href = "/projects/mapping_plant_species/";
            },},{id: "projects-",
          title: '🦜 🎵 ❓',
          description: "OrnithoQuizz - A quiz game to train your bird identification skills (audio and image)",
          section: "Projects",handler: () => {
              window.location.href = "/projects/ornithoquizz_project/";
            },},{
        id: 'social-email',
        title: 'email',
        section: 'Socials',
        handler: () => {
          window.open("mailto:%72%61%70%68%61%65%6C.%62%65%6E%65%72%72%61%64%69@%69%6E%72%69%61.%66%72", "_blank");
        },
      },{
        id: 'social-github',
        title: 'GitHub',
        section: 'Socials',
        handler: () => {
          window.open("https://github.com/RaphBnrd", "_blank");
        },
      },{
        id: 'social-linkedin',
        title: 'LinkedIn',
        section: 'Socials',
        handler: () => {
          window.open("https://www.linkedin.com/in/raphaël-benerradi-531a83196", "_blank");
        },
      },{
        id: 'social-orcid',
        title: 'ORCID',
        section: 'Socials',
        handler: () => {
          window.open("https://orcid.org/0009-0002-9020-0702", "_blank");
        },
      },{
        id: 'social-researchgate',
        title: 'ResearchGate',
        section: 'Socials',
        handler: () => {
          window.open("https://www.researchgate.net/profile/Raphael-Benerradi/", "_blank");
        },
      },{
        id: 'social-scholar',
        title: 'Google Scholar',
        section: 'Socials',
        handler: () => {
          window.open("https://scholar.google.com/citations?user=ww75IXIAAAAJ", "_blank");
        },
      },{
      id: 'light-theme',
      title: 'Change theme to light',
      description: 'Change the theme of the site to Light',
      section: 'Theme',
      handler: () => {
        setThemeSetting("light");
      },
    },
    {
      id: 'dark-theme',
      title: 'Change theme to dark',
      description: 'Change the theme of the site to Dark',
      section: 'Theme',
      handler: () => {
        setThemeSetting("dark");
      },
    },
    {
      id: 'system-theme',
      title: 'Use system default theme',
      description: 'Change the theme of the site to System Default',
      section: 'Theme',
      handler: () => {
        setThemeSetting("system");
      },
    },];
