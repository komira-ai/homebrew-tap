class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.127/mopm-0.0.127-macos-arm64.tar.gz"
      sha256 "d78016cbe7dd39f06ed0598d15a00a67657220d0eeb5ead329c215b11e0b5756"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.127/mopm-0.0.127-linux-aarch64.tar.gz"
      sha256 "123607690b49c84573192afd672c6621752429e502f57e3b0f2d90198fc56df5"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.127/mopm-0.0.127-linux-x86_64.tar.gz"
      sha256 "e355d14fa397c7c8e35005980d1a39f7af5d9583317419d0656fbb0e5e24829e"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
