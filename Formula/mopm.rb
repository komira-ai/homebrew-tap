class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.79/mopm-0.0.79-macos-arm64.tar.gz"
      sha256 "23c12bb22a495b6dfca0517145a9a765f9e5eddbbc4eaabac826843a8a2da908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.79/mopm-0.0.79-linux-aarch64.tar.gz"
      sha256 "1e8cf2aa0485f8b21a264765323b845ad27f013f9b24c5607d359df9587ddcea"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.79/mopm-0.0.79-linux-x86_64.tar.gz"
      sha256 "00ae4a648067b98b95041c16f7e855088b031d388e304bf89cc121d5464c7f6f"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
