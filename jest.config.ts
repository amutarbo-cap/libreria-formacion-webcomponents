import type { Config } from "jest";

const config: Config = {
  preset: "ts-jest",
  testEnvironment: "jsdom",
  testMatch: ["<rootDir>/src/**/*.test.ts"],
  moduleNameMapper: {
    "^lit$": "<rootDir>/node_modules/lit/index.js",
    "^lit/(.*)$": "<rootDir>/node_modules/lit/$1",
  },
  coverageDirectory: "coverage",
  coverageThreshold: {
    global: { branches: 90, functions: 90, lines: 90, statements: 90 },
  },
  coveragePathIgnorePatterns: ["/node_modules/", "/upstream/"],
  transform: {
    "^.+\\.ts$": ["ts-jest", { useESM: true }],
  },
  extensionsToTreatAsEsm: [".ts"],
};

export default config;
