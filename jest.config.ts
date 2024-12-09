import { Config } from "@jest/types";

const config: Config.InitialOptions = {
  preset: "ts-jest",
  testEnvironment: "node",
  clearMocks: true,
  collectCoverage: true,
  collectCoverageFrom: ["src/v*/**/*.ts"],
  coverageDirectory: "coverage",
  coverageReporters: ["lcov", "text-summary"],
  maxWorkers: "50%",
  modulePathIgnorePatterns: ["/.build"],
  testPathIgnorePatterns: ["/node_modules/", "/.build", "/out"],
};

export default config;
