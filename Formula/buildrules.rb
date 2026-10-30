class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.71/buildrules-cli-0.0.71-macos-arm64.tar.gz"
      sha256 "7ff807f24b53b61a681cca948c220da0574b29502cda154fb297dbe2e3ccdda0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.71/buildrules-cli-0.0.71-linux-aarch64.tar.gz"
      sha256 "938a447038bbffcc4b1ded8b53e649bd161645913af15d13e396d5d701cd1af4"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.71/buildrules-cli-0.0.71-linux-x86_64.tar.gz"
      sha256 "b23d0435e357101f51c23b3733018bfde86a5e9674ca47a8cd042ad78162c9b8"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
