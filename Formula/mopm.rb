class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.63/mopm-0.0.63-macos-arm64.tar.gz"
      sha256 "f791197625315ec0d3f099d3b16ff0ccb804412db5e4b242328f9d1c4677a907"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.63/mopm-0.0.63-linux-aarch64.tar.gz"
      sha256 "1bcc0188254cacb358b40f313ea25b916efa359e3f9785edbde72038af5020d7"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.63/mopm-0.0.63-linux-x86_64.tar.gz"
      sha256 "dad81cf2cdcf056a4ae8aeee3cc437c5119ef0a1ac1b8b8612b15253148ae568"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
