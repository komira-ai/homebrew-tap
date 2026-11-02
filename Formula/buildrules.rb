class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.73/buildrules-cli-0.0.73-macos-arm64.tar.gz"
      sha256 "3c55197d83cfd0d7a48619c9e8cd5495d5c4af4cf060063a53b1dff77d5083f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.73/buildrules-cli-0.0.73-linux-aarch64.tar.gz"
      sha256 "f231e9ec23da4e6a9217835dd67e4ef7a1776367808881a463d21fb48bedab63"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.73/buildrules-cli-0.0.73-linux-x86_64.tar.gz"
      sha256 "95d03b89550065c09eb026230e56a61dee2c641f32c3725d94f820633b6b8d94"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
