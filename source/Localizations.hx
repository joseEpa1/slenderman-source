package;

import flixel.FlxG;


class Localizations
{
    public static var languageVar:String = 'eng';
    public static var languageName:String = 'English';
    public static var warnVar:String;
    public static var mmwmVar:String;
    public static var deathVar:String;
    public static var goodDeath:String;
    public static var badDeath:String;
    public static var shitDeath:String;
    public static var shitDeathYT:String;
    public static var missDeath:String;
    public static var invKeyCheeseDeath:String;

    public static var missedTxt:String;
    public static var scoreTxt:String;
    public static var accTxt:String;
    public static var ukTxt:String;

    public static var weekCleared:String;
    public static var songCleared:String;

    public static var lovinMem:String;

    public static var proxyTxt:String;

    public static var hallDesc:String;

    public static function setLanguage():Void
    {
        switch (languageVar)
        {
            default:
                languageVar = 'eng';
                
            case 'eng':
                languageName = "Enlgish";

                warnVar = "WARNING!!"
                + "\n\n"
                + "THIS MOD CONTAINS CRAZY FILTERS AND JUMPSCARES.\nIF YOU ARE SENSIBLE, DEACTIVATE THEM IN THE OPTIONS.";

                mmwmVar = "by Untitled Funkers team - (DEMO preview)";

                deathVar = "Cause of death: ";
                goodDeath = "got a Good! at 0 health.\n(Won't happen in Normal and Easy)";
                badDeath = "got a Bad at 0 health.\n(Won't happen in Easy)";
                shitDeath = "got a Shit at 0 health.\nStop spamming";
                shitDeathYT = "got a Sh*t at 0 health.\nStop spamming and calling yourself good.\nYou're not.";
                missDeath = "missed a step at 0 health.";
                invKeyCheeseDeath = "you tried to cheese your way through Inverted Controls using the arrow keys.\nTry using " + FlxG.save.data.leftBind + "-" + FlxG.save.data.downBind + "-" + FlxG.save.data.upBind + "-" + FlxG.save.data.rightBind + ".";

                missedTxt = "Misses:";
                scoreTxt = "Score:";
                accTxt = "Accuracy:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Week cleared!";
                songCleared = "Song cleared!";

                lovinMem = "in loving memory of";

                proxyTxt = "mod";

                hallDesc = "First three people who have beaten (old) Engage on Hard:";

            case 'por':
                languageName = "Português";
                
                warnVar = "WARNING!!"
                + "\n\n"
                + "ESSE MOD TEM UNS FILTROS BIZARROS E JUMPSCARES! DESATIVE-OS NAS CONFIGURAÇÕES SE VOCÊ É SENSIVEL.";

                mmwmVar = "pela equipe Untitled Funkers - (Versão Demonstrativa)";

                deathVar = "Causa da morte: ";
                goodDeath = "Tirou um Good! com 0 de hp.\n(Não vai acontecer no Normal e no Easy)";
                badDeath = "Tirou um Bad com 0 de hp.\n(Não vai acontecer no Easy)";
                shitDeath = "Tirou um Shit com 0 de hp.\nPara de spammar";
                shitDeathYT = "Tirou um Sh*t com 0 de hp.\nPara de spammar e se achar bom.\nVocê não é.";
                missDeath = "Perdeu um step com 0 de hp.";
                invKeyCheeseDeath = "needa ask canondev for a translation\ntranslate pls " + FlxG.save.data.leftBind + "-" + FlxG.save.data.downBind + "-" + FlxG.save.data.upBind + "-" + FlxG.save.data.rightBind + ".";

                missedTxt = "Erros:";
                scoreTxt = "Pontuação:";
                accTxt = "Precisão:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Semana concluída!";
                songCleared = "Música concluída!";

                lovinMem = "em memória amorosa de";

                proxyTxt = "mod";

                hallDesc = "ask canondev for translation:";

            case 'esp':
                languageName = "Español";
                
                warnVar = "ADVERTENCIA!!"
                + "\n\n"
                + "ESTE MOD CONTIENE FILTROS AGITADOS Y JUMPSCARES, DESACTIVALOS EN OPTIONS SI USTED ES SENSIBLE.";

                mmwmVar = "hecho por el equipo de Untitled Funkers - (DEMO avances)";

                deathVar = "Causa de muerte: ";
                goodDeath = "obtuviste un Good! con 0 de HP.\n(Esto no ocurrirá en Normal y Easy)";
                badDeath = "obtuviste un Bad con 0 de HP.\n(Esto no ocurrirá en Easy)";
                shitDeath = "obtuviste un Shit con 0 de HP.\nDeja de Spamear.";
                shitDeathYT = "obtuviste un Sh*t con 0 de HP.\nDeja de Spamear y aun así considerarte 'bueno'.\nNo lo eres.";
                missDeath = "fallaste un step con 0 de HP.";
                invKeyCheeseDeath = "trataste de trucar tu camino durante los controles invertidos usando las teclas de flechas lmao vuelvete mejor\ntranslate pls " + FlxG.save.data.leftBind + "-" + FlxG.save.data.downBind + "-" + FlxG.save.data.upBind + "-" + FlxG.save.data.rightBind + ".";

                missedTxt = "Fallos:";
                scoreTxt = "Puntos:";
                accTxt = "Precisión:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Semana completada!";
                songCleared = "Canción completada!";

                lovinMem = "En recuerdo amoroso de";

                proxyTxt = "mod";

                hallDesc = "ask ezekiel for translation:";

            case 'ita':
                languageName = "Italiano";
                
                warnVar = "ATTENZIONE!!"
                + "\n\n"
                + "QUESTA MOD CONTIENE FILTRI PAZZURDI E JUMPSCARE!\nSE SIETE SENSIBILE, LE DISATTIVI NELLE OPZIONI.";

                mmwmVar = "dal team Untitled Funkers - (anteprima DEMO)";

                deathVar = "Causa della morte: ";
                goodDeath = "ottenuto un Good! a 0 di salute.\n(Non succederà in Normal ed Easy)";
                badDeath = "ottenuto un Bad a 0 di salute.\n(Non succederà in Easy)";
                shitDeath = "ottenuto un Shit a 0 di salute.\nSmetti di spammare";
                shitDeathYT = "ottenuto un Sh*t a 0 di salute.\nSmetti di spammare e chiamarti un bravo giocatore.\nNon lo sei.";
                missDeath = "mancato uno step a 0 di salute.";
                invKeyCheeseDeath = "hai cercato di cheattare i Controlli Invertiti con le frecce direzionali lmao che nabbo\nProva ad usare " + FlxG.save.data.leftBind + "-" + FlxG.save.data.downBind + "-" + FlxG.save.data.upBind + "-" + FlxG.save.data.rightBind + ".";

                missedTxt = "Falli:";
                scoreTxt = "Punteggio:";
                accTxt = "Precisione:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Settimana completata!";
                songCleared = "Traccia completata!";

                lovinMem = "in amoroso ricordo di";

                proxyTxt = "mod";

                hallDesc = "Primi tre giocatori che hanno battuto Engage (vecchio) in Hard:";

            case 'fra':
                languageName = "Français";
                
                warnVar = "AVERTISSEMENT!!"
                + "\n\n"
                //Ce mod contient des filtres fous et des jumpscares    
                + "CE MOD CONTIENT DES FILTRES FOUS ET DES JUMPSCARES!\nSI VOUS ÊTES SENSIBLE, DÉSACTIVEZ-LES DANS LES OPTIONS.";

                mmwmVar = "de l'équipe Untitled Funkers - (aperçu DÉMO)";

                deathVar = "Cause de décès: ";
                goodDeath = "obtenu un Good! à 0 santé.\n(Ne se produira pas en Normal et Facile)";
                badDeath = "obtenu un Bad à 0 santé.\n(Ne se produira pas en Facile)";
                shitDeath = "obtenu un Shit à 0 santé.\nArrête de spammer";
                missDeath = "raté un step à 0 santé.";
                invKeyCheeseDeath = "vous avez essayé de tricher à travers les contrôles inversés avec les touches fléchées lmao quel noob\ntranslate pls " + FlxG.save.data.leftBind + "-" + FlxG.save.data.downBind + "-" + FlxG.save.data.upBind + "-" + FlxG.save.data.rightBind + ".";

                missedTxt = "Raté:";
                scoreTxt = "But:";
                accTxt = "Précision:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Semaine terminée!";
                songCleared = "Chanson terminée!";

                lovinMem = "a la memoire de";

                proxyTxt = "mod";

                hallDesc = "Les trois premiers joueurs à avoir battu (vieux) Engage in Hard:";

            case 'niho':
                languageName = "日本語";
                
                warnVar = "警告！!!"
                + "\n\n"
                + "このMODにはクレイジーなフィルターとジャンプスケアが含まれています!\n賢明な場合は、オプションでそれらを非アクティブ化します.";

                mmwmVar = "チームから Untitled Funkers (アンタイトルド ファンカース) - (デモプレビュー)";

                deathVar = "死因: ";
                goodDeath = "obtenu un Good! à 0 santé.\n(Ne se produira pas en Normal et Facile)";
                badDeath = "obtenu un Bad à 0 santé.\n(Ne se produira pas en Facile)";
                shitDeath = "obtenu un Shit à 0 santé.\nArrête de spammer";
                missDeath = "raté un step à 0 santé.";
                invKeyCheeseDeath = "vous avez essayé de tricher à travers les contrôles inversés avec les touches fléchées lmao quel noob";

                missedTxt = "Raté:";
                scoreTxt = "But:";
                accTxt = "Précision:";
                ukTxt = "unkown, please contact the developers with this code: ";

                weekCleared = "Semaine terminée!";
                songCleared = "Chanson terminée!";

                lovinMem = "a la memoire de";

                proxyTxt = "et proxy";

                hallDesc = "Les trois premiers joueurs à avoir battu (vieux) Engage in Hard:";
        }
    }
}