class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.45/mopm-0.0.45-macos-arm64.tar.gz"
      sha256 "7ff07b186f958cc810207b865e6493029f7ff7ca90a3b595d03784ac01f6ee2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.45/mopm-0.0.45-linux-aarch64.tar.gz"
      sha256 "384717516a0796186456373b8d8ad1b07b8fdcadf9e6bbc6f1c1c5e345b7e1f5"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.45/mopm-0.0.45-linux-x86_64.tar.gz"
      sha256 "7ea89407ed975d46dca8566d8cf3078fd9fd61e460aff3a795f3d097a8d30fae"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
