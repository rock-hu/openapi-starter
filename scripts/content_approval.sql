--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: content_approval; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_approval (
    content_approval_id character varying(20) NOT NULL,
    content_id character varying(20),
    content_revision_seq_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    approval_status_id character varying(20),
    approval_date timestamp with time zone,
    sequence_num numeric(20,0),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_approval OWNER TO ofbiz;

--
-- Name: content_approval pk_content_approval; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_approval
    ADD CONSTRAINT pk_content_approval PRIMARY KEY (content_approval_id);


--
-- Name: cntnt_apprl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_apprl_txcrts ON content_approval USING btree (created_tx_stamp);


--
-- Name: cntnt_apprl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_apprl_txstmp ON content_approval USING btree (last_updated_tx_stamp);


--
-- Name: cntntappr_apsi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntappr_apsi ON content_approval USING btree (approval_status_id);


--
-- Name: cntntappr_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntappr_cnt ON content_approval USING btree (content_id);


--
-- Name: cntntappr_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntappr_pty ON content_approval USING btree (party_id);


--
-- Name: cntntappr_rltp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntappr_rltp ON content_approval USING btree (role_type_id);


--
-- Name: content_approval cntntappr_apsi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_approval
    ADD CONSTRAINT cntntappr_apsi FOREIGN KEY (approval_status_id) REFERENCES status_item(status_id);


--
-- Name: content_approval cntntappr_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_approval
    ADD CONSTRAINT cntntappr_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: content_approval cntntappr_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_approval
    ADD CONSTRAINT cntntappr_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: content_approval cntntappr_rltp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_approval
    ADD CONSTRAINT cntntappr_rltp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

